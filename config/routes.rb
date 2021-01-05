Rails.application.routes.draw do
  
  resources :cars, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :mechanics
  resources :owners
  resources :parts, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :service_records
  resources :services, only: [:index, :new, :create, :edit, :update, :destroy]
  root "home#index"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy", as: "logout"
end
