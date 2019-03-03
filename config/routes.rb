Rails.application.routes.draw do
  root to: 'users#index'

  resources :users

  resources :campaigns

  resources :join_requests, except: [:index]
  resources :user_campaigns, except: [:index]

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
  !request.xhr? && request.format.html?
  end
end
