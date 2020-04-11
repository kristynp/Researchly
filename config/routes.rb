Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout route
  get '/logout' => 'sessions#destroy'

  resources :users 
  resources :research_goals 
  resources :resources 
  resources :journals 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
