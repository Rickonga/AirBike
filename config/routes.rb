Rails.application.routes.draw do
  devise_for :users
  root to: 'bikes#index'
  # root to: 'pages#bikes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bikes, except: :index
end
