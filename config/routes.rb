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
    resources :seasons, only: %i[new] do
      resources :episodes, only: %i[new]
    end
  end
  resources :seasons, only: %i[create show]
  resources :episodes, only: %i[create show]

  # Session Control
  get '/login' => 'sessions#new'
  post '/logout' => 'sessions#destroy'
  resources :sessions, only: %i[create]

  # Omniauth
  get '/auth/:provider/callback' => 'sessions#omni_create'
  
  # Basic API endpoints
  get '/users/:id/data' => 'users#data'
  get '/reviews/:id/data' => 'reviews#data'
  get '/media/:id/data' => 'media#data'
  get '/movies/:id/data' => 'movies#data'
  get '/series/:id/data' => 'series#data'
  get '/seasons/:id/data' => 'seasons#data'
  get '/episodes/:id/data' => 'episodes#data'

  # fallback
  get '*path' => redirect('/')

end
