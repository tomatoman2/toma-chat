Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :users, only: [:edit, :update, :index, :show]
  resources :messages do
    resources :comments, only: :create
  end
  resources :categories, only: [:show]
end
