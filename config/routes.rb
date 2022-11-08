# frozen_string_literal: true

Rails.application.routes.draw do
  resources :drinkings
  root 'home#index'

  resources :liquors do
    resources :comments, only: %i[create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
