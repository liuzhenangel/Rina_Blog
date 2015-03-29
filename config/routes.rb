Rails.application.routes.draw do

  namespace :admin do
    resources :posts
  end

  resources :articles
  resources :comments
  post '/preview', to: 'admin/posts#preview'
  post '/photos', to: 'admin/posts#photos'

  post '/search', to: 'articles#search'
  get  '/search', to: 'articles#search'

  post '/signin', to: 'admin/sessions#create'
  get '/signin', to: 'admin/sessions#new'
  get '/signout', to: 'admin/sessions#destroy'

  get '/blog/rss', to: 'welcome#rss'
  get '/about', to: 'welcome#about'
  get '/photo', to: 'welcome#photo'
  get '/all', to: 'articles#index'
  root 'welcome#index'
end
