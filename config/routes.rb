Rails.application.routes.draw do

  root to: 'users#index'
  match '/users/:user_id/posts/:id', to: 'posts#update', via: :post

  resources :users do
    resources :posts do
      resources :comments
      resources :tags
    end
    resources :pages
  end


end
