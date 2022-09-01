Rails.application.routes.draw do
  # match '*all' => 'application#cors_preflight_check', :constraints => { method: 'OPTIONS' }

  resources :requests
  resources :assets
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  # post "/signup", to: "user#create"
  get "/me", to: "users#show"
  get "/available_assets", to: "assets#assets_without_users"

end
