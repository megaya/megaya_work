Rails.application.routes.draw do
  root to: 'home#index'

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :articles, only: [:index, :show, :create]
    end
  end
end
