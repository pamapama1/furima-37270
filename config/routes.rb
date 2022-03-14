Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get 'items/new'
  post 'items/new'
  root to: 'items#index'

  resources :users, only:[:create]
  resources :items, only:[:new , :create ]
end
