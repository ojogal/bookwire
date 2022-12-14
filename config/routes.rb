# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
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
      resources :booking_units
      resources :user_brands
      resources :tokens, only: [:create]
    end
  end
end
