Rails.application.routes.draw do

  root to: 'users#index'

  resources :users do
    resources :post do
      resources :comment
      resources :tag
    end
    resources :pages
  end

end
