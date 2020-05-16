Rails.application.routes.draw do
  devise_for :users
  root "homes#index"
  resources :messages do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :update, :show]
  resources :categories, only: [:show]
end
