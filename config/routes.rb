Rails.application.routes.draw do
  devise_for :users
  root to: 'foods#homepage'
  # resources :pages
  get "contacts", to: "pages#contacts"
  get "mentions", to: "pages#mentions"
  get "infos", to: "pages#infos"

  resources :categories, only: [:index, :show]
  resources :foods do
    resources :ratings, only: [:new, :create, :update]
  end

  resources :ratings, except: [:new, :create, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
