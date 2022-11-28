Rails.application.routes.draw do
  resources :comments, only: [:index, :create, :update, :destroy, :show]
  resources :pets, only: [:index, :create, :update, :destroy, :show]
  resources :users, only: [:index, :create, :update, :destroy, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  
end
