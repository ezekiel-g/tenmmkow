Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :armies, only: [:index]
  resources :groups

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      resources :armies, only: [:index, :show]
      resources :units, only: [:index, :show]
      resources :groups
      resources :memberships, only: [:create]
    end
  end
end
