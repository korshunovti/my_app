Rails.application.routes.draw do
  root 'anime_mir#index'
  get 'anime_mir', to: 'anime_mir#index'

  get    'signup',  to: 'users#new'
  get    'signin',  to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  resources :users, except: [:index]

  get 'favorites', to: 'favorites#index'
  get 'rating',    to: 'rating#index'
  get 'main/about'
  get 'main/contacts'

  namespace :api do
    get  'theme_titles', to: 'gallery#theme_titles'
    post 'values',       to: 'gallery#create_value'
    post 'favorites',    to: 'gallery#toggle_favorite'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end