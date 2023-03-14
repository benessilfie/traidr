# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, path: '', constraints: { subdomain: 'api' }, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[show create update destroy]
      resources :products

      namespace :auth do
        resources :sessions, only: %i[create destroy]
      end
    end
  end
end
