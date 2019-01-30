Rails.application.routes.draw do  
  root 'static#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get '/login/' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  
  resources :users, only: %i[show update]
  
  # omniauth
  get '/auth/:provider/callback' => 'sessions#omni_create'
end
