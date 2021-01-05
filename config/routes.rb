Rails.application.routes.draw do
  get 'home/index'
  resources :cars, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :mechanics
  resources :owners
  resources :parts, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :service_records
  resources :services, only: [:index, :new, :create, :edit, :update, :destroy]
  root "home#index"
  resources :users
end
