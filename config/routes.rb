Rails.application.routes.draw do
  root 'albums#index'

  resources :albums
  resources :users

  get 'signup' => 'users#new'
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
