Rails.application.routes.draw do
  root to: 'home#index'

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :articles, only: [:index, :show, :create]
    end
  end
end
