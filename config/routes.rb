Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'seeds#index'
  resources :seeds, only: [:show, :index, :new, :create]

  resources :users do
    resources :gardens, only: [:show, :new, :create]
  end

  resources :gardens, only: [:show, :new, :create]

  post 'auth', to: "sessions#login"
  post 'autologin', to: "sessions#autologin"

  post 'removeseed', to: "gardens#removeseed"
  post 'addseed', to: "gardens#addseed"
  
end
