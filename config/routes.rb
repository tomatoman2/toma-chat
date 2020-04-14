Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :users, only: [:edit, :update, :index, :show]
  resources :messages, only: [:index, :create, :new, :destroy, :edit, :update]
  resources :categories, only: [:show]
end
