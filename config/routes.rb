Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users
  resources :establishments,  except: :index do
    resources :courses, only: [:create, :new]
  end
  resources :courses, only: [:index, :show, :update, :edit, :destroy]


  resources :appointments do
    resources :reviews, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

