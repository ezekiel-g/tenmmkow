Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :armies, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :armies, only: [:index, :show]
      resources :units, only: [:index, :show]
    end
  end
end
