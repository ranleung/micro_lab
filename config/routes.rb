Rails.application.routes.draw do

  root to: 'users#index'

  resources :users do
    resources :posts do
      resources :comments
      resources :tags
    end
    resources :pages
  end

end