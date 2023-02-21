Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cameras, only: %i[index show new create] do
    resources :bookings, only: :create
  end
  resources :bookings, only: %i[update index]
  namespace :lender do
    resources :bookings, only: :index
  end
end
