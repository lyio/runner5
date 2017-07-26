Rails.application.routes.draw do
  devise_for :users
  root 'static#home'

  resources :users, only: [:create]
  get '/register', to: 'users#register'

  resources :runs

  resources :run_types

  resources :shoes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  