Rails.application.routes.draw do
  resources :posts
  resources :usuarios, as: :users, only: [:show, :update]
  resources :friendships, only: [:create, :update]
  devise_for :users
  
  authenticated :user do
    root 'main#home'
  end

  unauthenticated :user do
    root 'main#unregistered', as: :unregistered
  end

  mount ActionCable.server => '/cable'
end
