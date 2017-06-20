Rails.application.routes.draw do
  get 'courses/index'

  get 'courses/new'

  get 'courses/show'

  get 'courses/destroy'

  get 'courses/update'

  get 'courses/edit'

  get 'appointments/new'

  get 'appointments/create'

  get 'appointments/destroy'

  get 'appointments/update'

  get 'appointments/edit'

  get 'reviews/index'

  get 'reviews/new'

  get 'reviews/create'

  get 'establishments/new'

  get 'establishments/show'

  get 'establishments/create'

  get 'establishments/update'

  get 'establishments/destroy'

  get 'establishments/edit'

  get 'users/show'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
