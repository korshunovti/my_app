Rails.application.routes.draw do
  resources :values
  resources :anime_titles
  resources :themes
  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
  get 'main/index'
  get 'main/help'
  get 'main/contacts'
  get 'main/about'

  get 'anime_mir', to: 'anime_mir#index'

  get "up" => "rails/health#show", as: :rails_health_check
  get 'favorites', to: 'favorites#index'
  get 'rating', to: 'rating#index'

  root 'anime_mir#index'
  namespace :api do
    post 'favorites', to: 'gallery#toggle_favorite'
    get 'theme_titles', to: 'gallery#theme_titles'
    post 'values', to: 'gallery#create_value'
  end

end