Rails.application.routes.draw do
  resources :cars, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :mechanics
  resources :owners
  resources :cars, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :service_records
  resources :services
  root "cars#home"
end
