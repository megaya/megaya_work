Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :articles, only: [:index, :show, :create]
    end
  end
end
