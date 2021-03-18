Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'seeds#index'
  resources :seeds

  resources :users do
    resources :gardens
  end
  
end
