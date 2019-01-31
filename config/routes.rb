Rails.application.routes.draw do  
  root 'static#home'

  # User Routes
  get '/signup' => 'users#new'
  resources :users, only: %i[show update create] do 
    resources :reviews, only: %i[index] 
    resources :views, only: %i[index]
  end
  resources :reviews, only: %i[create edit update destroy]
  resources :views, only: %i[create destroy]

  # Media Routes
  resources :media, only: %i[show] 
  resources :movies, only: %i[index new create show]
  resources :series, only: %i[index new create show] do
    resources :seasons, only: %i[index] do
      resources :episodes, only: %i[index]
    end
  end  
  resources :seasons, only: %i[new create show]
  resources :episodes, only: %i[new create show]

  # Session Control
  get '/login/' => 'sessions#new'
  post '/logout/' => 'sessions#destroy'
  resources :sessions, only: %i[create]
  # omniauth
  get '/auth/:provider/callback' => 'sessions#omni_create'
end
