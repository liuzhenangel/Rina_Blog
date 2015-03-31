require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
require 'mina/rvm'    # for rvm support. (http://rvm.io)

set :domain, 'yafeilee.me'
set :deploy_to, '/home/ruby/rina'
set :repository, 'git@github.com:liuzhenangel/Rina_Blog.git'
set :branch, 'master'
set :app_path, "#{deploy_to}/#{current_path}"

set :shared_paths, ['config/database.yml', 'config/application.yml', 'log', 'db/production.sqlite3', 'tmp']

set :user, 'ruby'    # Username in the server to SSH to.
set :port, '22'     # SSH port number.
set :forward_agent, true     # SSH forward_agent.

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .rbenv-version to your repository.
  # invoke :'rbenv:load'

  queue! %[source /usr/local/rvm/scripts/rvm]
  queue! %[rvm use 2.0.0]
  # For those using RVM, use this to load an RVM version@gemset.
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      invoke :'unicorn:restart'
    end
  end
end

namespace :unicorn do
  set :unicorn_pid, "#{app_path}/tmp/pids/unicorn_rina.pid"
  set :start_unicorn, %{
    cd #{app_path} && bundle exec unicorn -c config/unicorn/#{rails_env}.rb -E #{rails_env} -D
  }

  #                                                                    Start task
  # ------------------------------------------------------------------------------
  desc "Start unicorn"
  task :start => :environment do
    queue 'echo "-----> Start Unicorn"'
    queue! start_unicorn
  end

  #                                                                     Stop task
  # ------------------------------------------------------------------------------
  desc "Stop unicorn"
  task :stop do
    queue 'echo "-----> Stop Unicorn"'
    queue! %{
      mkdir -p "#{app_path}/tmp/pids"
      test -s "#{unicorn_pid}" && kill -QUIT `cat "#{unicorn_pid}"` && rm -rf "#{unicorn_pid}" && echo "Stop Ok" && exit 0
      echo >&2 "Not running"
    }
  end
  #                                                                  Restart task
  # ------------------------------------------------------------------------------
  desc "Restart unicorn using 'upgrade'"
  task :restart => :environment do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end
end
