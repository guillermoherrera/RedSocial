Rails.application.routes.draw do
  resources :posts
  resources :usuarios, as: :users, only: [:show, :update]
  devise_for :users
  
  authenticated :user do
    root 'main#home'
  end

  unauthenticated :user do
    root 'main#unregistered', as: :unregistered
  end
end
