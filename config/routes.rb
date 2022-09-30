# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  resources :posts

  devise_for :users
end
