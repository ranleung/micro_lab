Rails.application.routes.draw do


  get '/login' => 'session#new'

  post '/login'=> 'session#create'

  delete '/logout'=> 'session#destroy'
  get '/logout'=> 'session#destroy'

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
