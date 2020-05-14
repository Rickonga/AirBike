Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # root to: 'pages#bikes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bikes do
    resources :bookings
  end
end
