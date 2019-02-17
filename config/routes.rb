Rails.application.routes.draw do  
  root 'static#home'

  # Basic API endpoints
  get '/:controller/:id/data', action: 'data'
  get '/:controller/collection', action: 'collection'
  get '/users/:id/reviews' => 'users#reviews'
  get '/users/:id/views' => 'users#views'
  get '/cui' => 'application#current_user_info'

  # User Routes
  get '/signup' => 'users#new'
  resources :users, only: %i[show update create]
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

  # fallback
  match "*path", via: %i[get post], to: "application#handle_404"

end
