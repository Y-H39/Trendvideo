Rails.application.routes.draw do
  root 'pages#home'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users, only: :show
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
end
