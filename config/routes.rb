Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :messages only
  resources :users
  resources :groups, only: [:new,:edit,:create,:update] do
    resources :messages, only: [:index, :create]
  end
end
