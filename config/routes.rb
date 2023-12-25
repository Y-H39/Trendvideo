Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
end
