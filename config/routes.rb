Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats do
    resources :orders, only: [:new, :create]
    resources :ratings, only: [:new, :create, :update]
  end

  resources :orders, except: [:new, :create]
  resources :ratings, except: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
