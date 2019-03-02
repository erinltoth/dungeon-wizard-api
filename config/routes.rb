Rails.application.routes.draw do
  root to: 'users#index'

  resources :users , only: [:index, :show]

  resources :campaigns

  resources :join_requests
end
