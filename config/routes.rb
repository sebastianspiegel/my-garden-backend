Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'seeds#index'
  resources :seeds, only: [:show, :index, :new, :create]

  resources :users do
    resources :gardens, only: [:show, :new, :create, :index]
  end

  resources :gardens

  post 'auth', to: "sessions#login"
  post 'autologin', to: "sessions#autologin"

  # patch 'removeseed', to: "gardens#removeseed"
  # patch 'addseed', to: "gardens#addseed"
  
end
