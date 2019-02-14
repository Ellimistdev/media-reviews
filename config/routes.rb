Rails.application.routes.draw do  
  root 'static#home'

  concern :serializable do
    get :data, on: :member
  end

  # User Routes
  get '/signup' => 'users#new'
  resources :users, only: %i[show update create], concerns: :serializable do 
    resources :reviews, only: %i[index] 
    resources :views, only: %i[index]
  end
  resources :reviews, only: %i[create edit update destroy], concerns: :serializable
  resources :views, only: %i[create destroy], concerns: :serializable

  # Media Routes
  resources :media, only: %i[show], concerns: :serializable
  
  resources :movies, only: %i[index new create show], concerns: :serializable
  resources :series, only: %i[index new create show], concerns: :serializable do    
    resources :seasons, only: %i[new] do
      resources :episodes, only: %i[new]
    end
  end
  resources :seasons, only: %i[create show], concerns: :serializable
  resources :episodes, only: %i[create show], concerns: :serializable


  # Session Control
  get '/login' => 'sessions#new'
  post '/logout' => 'sessions#destroy'
  resources :sessions, only: %i[create]

  # Omniauth
  get '/auth/:provider/callback' => 'sessions#omni_create'

  # Basic API endpoints
  #  get '/users/:id/data' => 'users#data'
  #  get '/reviews/:id/data' => 'reviews#data'
  #  get '/media/:id/data' => 'media#data'
  #  get '/movies/:id/data' => 'movies#data'
  #  get '/series/:id/data' => 'series#data'
  #  get '/seasons/:id/data' => 'seasons#data'
  #  get '/episodes/:id/data' => 'episodes#data'

  # fallback
  get '*path' => redirect('/')

end
