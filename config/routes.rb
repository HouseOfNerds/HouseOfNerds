# frozen_string_literal: true

Rails.application.routes.draw do
  get 'login', to: 'login#login', as: :login
  post 'login', to: 'login#send_email'
  get 'logout', to: 'login#logout', as: :logout
  get 'search' => 'search#index'

  resources :administrators
  resources :asset_types
  resources :customers do
    member { get :image }
  end
  resources :loans do
    member { get :return }
  end

  root to: 'customers#index'
end
