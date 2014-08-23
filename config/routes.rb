Rails.application.routes.draw do

  get 'posts/index'

  get 'posts/new'

  get 'posts/edit'

  get 'posts/destroy'

  root to: 'users#index'

  resources :users do
    resources :post do
      resources :comment
      resources :tag
    end
    resources :pages
  end

end
