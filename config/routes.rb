Rails.application.routes.draw do

  namespace :admin do
    resources :photos, only: [:index, :destroy] do
      collection do
        post :upload
      end
    end

    resources :articles do
      collection do
        post :preview
        post :photos
      end
    end
  end

  resources :articles do
    collection do
      get :search
      post :search
    end
  end

  resources :comments

  get '/admin', to: 'admin/articles#index'

  post '/signin', to: 'admin/sessions#create'
  get '/signin', to: 'admin/sessions#new'
  get '/signout', to: 'admin/sessions#destroy'

  get '/blog/rss', to: 'welcome#rss'
  get '/about', to: 'welcome#about'
  get '/photo', to: 'welcome#photo'
  root 'welcome#index'
end
