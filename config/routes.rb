Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      
      resources :users do
        resources :entries
      end

      resources :entries do
        resources :comments
        resources :likes
      end

      get '/signup', to: "users#new"

      post '/signup', to: "users#create"

      get '/login', to: 'sessions#new'

      post '/login', to: 'sessions#create'

      post '/logout', to: 'sessions#destroy'

      get '/get_current_user', to: 'sessions#get_current_user'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
