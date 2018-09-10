Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users

  resources :armies, only: [:index]
  resources :groups do
    resources :memberships, only: [:new, :create, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      resources :armies, only: [:index, :show]
      resources :units, only: [:index, :show]
      resources :groups
    end
  end
end
