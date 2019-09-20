Rails.application.routes.draw do
  resources :homes do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, only: [:index, :show, :destroy, :update]

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
