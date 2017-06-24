Rails.application.routes.draw do


  ActiveAdmin.routes(self)

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  resources :users

  resources :establishments do
    resources :courses, only: [:create, :new]
  end

  resources :courses, only: [:index, :show, :update, :edit, :destroy]

  resources :appointments do
    resources :reviews, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

