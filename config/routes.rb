Rails.application.routes.draw do
  root 'welcome#index'
  get '/about', to: 'welcome#about'
  get '/blog/rss', to: 'welcome#rss'
end
