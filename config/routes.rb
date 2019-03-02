Rails.application.routes.draw do
  root to: 'users#index'

  resources :users

  resources :campaigns

  resources :join_requests, except: [:index]
  resources :user_campaigns
end
