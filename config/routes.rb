Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :messages do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :update, :index, :show]
  resources :categories, only: [:show]
end
