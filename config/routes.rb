Rails.application.routes.draw do
  resources :mechanics
  resources :owners do  
    resources :cars, only: [:new, :edit]
  end
  resources :cars, only: [:show, :create, :update, :destroy]
  resources :service_records do
    resources :parts, only: [:new, :edit]
  end
  resources :parts, only: [:show, :create, :update, :destroy]
  resources :services, only: [:index, :new, :create, :edit, :update, :destroy]
  root "home#index"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy", as: "logout"
end
