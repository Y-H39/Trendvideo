Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: :show
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
end
