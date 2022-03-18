Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get 'items/new'
  post 'items/new'
  post 'items/create'
  root to: 'items#index'

  resources :users, only:[:create]
  resources :items, only:[:new , :create ,:index]
end
