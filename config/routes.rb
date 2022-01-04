Rails.application.routes.draw do
  devise_for :users

  root 'events#index'

  resources :users, only: [:show, :edit, :update, :index]

  resources :events
end
