Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :accounts, skip: [:sessions, :passwords, :registrations]
  ActiveAdmin.routes(self)

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :articles, only: [:index, :show, :create]
      post '/login', to: 'session#log_in'
      post '/logout', to: 'session#log_out'
      get  '/account', to: 'accounts#show'
    end
  end
end
