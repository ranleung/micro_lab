Rails.application.routes.draw do


  root to: 'users#index'

  get "/login" => "session#new"
  post "/login" => "session#create"

  delete "/logout" => "session#destroy"
  get "/logout" => "session#destroy"  # TODO: DELETE THIS BEFORE PRODUCTION

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
