Rails.application.routes.draw do
  resources :requests
  resources :assets
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/sigin", to: "session#create"
  get "/logout", to: "session#destroy"
  post "/signup", to: "user#create"
  get "/me", to: "user#show"
end
