Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # root to: 'pages#bikes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "mybikes", to: "bikes#mybikes"
  resources :bikes do
    resources :bookings, only: [:create, :show]
  end
  resources :bookings, only: :show do
    resources :reviews, only: :create
  end
end
