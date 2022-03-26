Rails.application.routes.draw do
  devise_for :users
  get 'items/index'

  root to: 'items#index'

  #resources :users, only:[:create]
  resources :items
  resources :orders, only: [:index,:create]
end
