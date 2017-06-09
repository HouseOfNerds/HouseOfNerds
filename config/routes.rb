# frozen_string_literal: true

Rails.application.routes.draw do
  resources :administrators
  resources :customers

  root to: 'customers#index'
end
