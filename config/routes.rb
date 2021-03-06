Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/projects/authored', to: 'projects#authored'
  
  resources :projects
  resources :palettes

  resources :palettes, only: [:show, :index] do
    resources :colors, only: [:new, :create, :edit, :update, :show]
  end
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/auth/failure', to: redirect('/auth/google_oath2')


end