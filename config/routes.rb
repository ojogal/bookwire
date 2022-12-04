Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :bookings
      resources :units
      resources :branches
      resources :brands
      resources :users
      resources :payments
      resources :unit_types
      resources :locations
      resources :categories
      resources :roles
      resources :booking_statuses
      resources :currencies
    end
  end
end
