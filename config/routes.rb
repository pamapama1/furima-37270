Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get 'users/sign_up' ,to: 'devise/registrations#new'
  get 'users/sign_in' ,to: 'devise/sessions#new'
  root to: 'items#index'

  resources :users, only:[:create]
end
