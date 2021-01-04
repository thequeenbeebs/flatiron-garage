Rails.application.routes.draw do
  resources :cars
  resources :mechanics
  resources :owners
  resources :parts
  resources :service_records
  resources :services
end
