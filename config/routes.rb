Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:show, :edit, :update, :index]
  resources :groups, only: [:new, :edit, :create, :update] do
    resources :messages, only: [:index, :create]
  end
end
