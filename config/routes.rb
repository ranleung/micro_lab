Rails.application.routes.draw do


  root to: 'users#index'

  resources :users do
    resources :tags
    resources :posts do
      # resources :comments
      # resources :tags
    end
    resources :pages
  end


  resources :posts do
  	resources :comments
  end 




end
