Rails.application.routes.draw do
  get 'photo/create'

  namespace :admin do
    resources :posts
  end
  resources :articles
  resources :comments
  root 'welcome#index'
  get '/about', to: 'welcome#about'
  get '/blog/rss', to: 'welcome#rss'
  get '/all', to: 'articles#index'
end
