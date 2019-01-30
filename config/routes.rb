Rails.application.routes.draw do  
  root 'static#home'

  # User Routes
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  resources :users, only: %i[show update] do 
    resources :reviews, only: %i[index] 
    resources :views, only: %i[index]
  end
  resources :reviews, only: %i[destroy create edit update] 
  resources :views, only: %i[destroy create]

  # Media Routes
  resources :media, only: %i[index show] 
  resources :movies, only: %i[index new create show]
  resources :series, only: %i[index new create show] do
    resources :seasons, only: %i[index] do
      resources :episodes, only: %i[index]
    end
  end  
  resources :seasons, only: %i[show create new]
  resources :episodes, only: %i[show create new]

  # Session Control
  get '/login/' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  # omniauth
  get '/auth/:provider/callback' => 'sessions#omni_create'
end
