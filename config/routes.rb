Rails.application.routes.draw do
  devise_for :users
  
  authenticated :user do
    root 'main#home'
  end

  unauthenticated :user do
    root 'main#unregistered', as: :unregistered
  end
end
