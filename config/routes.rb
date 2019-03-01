Rails.application.routes.draw do
  root to: 'users#index'

  resources :users , only: [:index, :show]

  resources :campaigns
end
