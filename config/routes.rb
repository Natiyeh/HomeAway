Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :homes do
    resources :bookings, only: [ :new, :create ]
    resources :reviews, only: [ :new, :create, :index ]
  end

  resources :reviews, only: [ :show, :edit, :update, :destroy ]

  resources :bookings, only: [:index, :show, :destroy, :update]

  resources :listings, only: [:index]

  resources :guests, only: [:index]

  resources :users, only: [:show, :update, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
