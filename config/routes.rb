Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  # post '/items/new', to: 'items#new'
  resources :items, only: [:new, :index, :create]
end