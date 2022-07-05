Rails.application.routes.draw do

  root 'products#index'

  resources :products
  resources :users

  resources :order_items


  get 'cart' => 'cart#show'
  get 'signup' => 'users#new'
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'search' => 'products#search'
  post '/cart' => 'order_items#destroy'



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
