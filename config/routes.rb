Rails.application.routes.draw do
  devise_for :users

  root 'items#index'
  resources :items

  root to: 'orders#index'
  resources :orders, only:[:create]
end