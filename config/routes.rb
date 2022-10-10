# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    scope module: :posts do
      resources :comments, only: %i[create]
      resources :likes, only: %i[create destroy]
    end
  end

  devise_for :users
end
