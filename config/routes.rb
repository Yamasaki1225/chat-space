Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :messages
  resources :users
  resources :groups, only: [:new,:edit,:create]
end
