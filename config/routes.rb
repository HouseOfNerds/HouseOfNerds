# frozen_string_literal: true

Rails.application.routes.draw do
  get 'login', to: 'login#login', as: :login
  post 'login', to: 'login#send_email'
  get 'logout', to: 'login#logout', as: :logout
  get 'registration/confirmation'
  post 'registration/create'
  get 'registration/new'
  get 'search' => 'search#index'
  get 'status' => 'status#index'

  resources :administrators
  resources :asset_types
  resources :customers do
    member do
      get :image
      post :save_image
    end
  end
  resources :departments
  resources :loans do
    member { get :return }
  end

  root to: 'loans#index'
end
