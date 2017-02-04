Rails.application.routes.draw do
  root 'static#home'

  resources :users, only: [:create]
  get '/register', to: 'users#register'

  resources :runs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
