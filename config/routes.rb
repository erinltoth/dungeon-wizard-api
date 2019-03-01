Rails.application.routes.draw do
  root to: 'users#index'

  resources :users , only: [:index, :show]

  resources :campaigns, only: [:index, :show, :create, :edit, :update]
end
