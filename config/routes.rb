Rails.application.routes.draw do

  resources :resource_notes
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout route
  delete '/logout' => 'sessions#destroy'

  # Routes for Google authentication
  get '/auth/:provider/callback' => 'sessions#omnilogin'

  resources :research_goals do 
    resources :resources, only: [:new, :create, :index]
    resources :research_goal_notes
  end 

  resources :resources do 
    resources :resource_notes, only: [:new, :create]
  end

  resources :users do
    resources :research_goals, only: [:new, :create, :index] 
  end
  
  resources :resources
  resources :journals
  resources :resource_notes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
