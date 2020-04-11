Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :users, only: [:edit, :update, :index]
  resources :messages, only: [:index, :create, :new]
end
