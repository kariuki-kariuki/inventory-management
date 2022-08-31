Rails.application.routes.draw do
  # match '*all' => 'application#cors_preflight_check', :constraints => { method: 'OPTIONS' }

  resources :requests
  resources :assets
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  # post "/signup", to: "user#create"
  get "/me", to: "users#show"
<<<<<<< HEAD
=======

  # Admin Users list View 
  get '/all_users', to: "users#index"



  mount ActionCable.server => '/cable'
>>>>>>> 6e5143e (actin cable setup)
end
