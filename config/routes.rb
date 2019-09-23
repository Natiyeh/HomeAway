Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :homes do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, only: [:index, :show, :destroy, :update]

  resources :listings, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
