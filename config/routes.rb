Rails.application.routes.draw do
  root 'static#home'

  resources :users, only: [:create]
  get '/register', to: 'users#register'

  get '/auth/:user_id/:token', to: 'sessions#auth'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  resources :runs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
