# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'games#index'
  resources :games do
    member do
      get :guess_place
      get :vote_for_spy
    end
  end
  resources :players, only: %i[create destroy] do
    collection do
      get :get_ready
    end
  end
end
