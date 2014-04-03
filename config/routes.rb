ProjectCurrently::Application.routes.draw do
  
  root 'users#new'

  resources :comments
  resources :support_requests

  resources :projects
  
  get '/user/:user_id' => 'user#show'
  get '/dashboard' => 'projects#show'

  resources :users
  resources :sessions, only: [:create, :new, :destroy]

  get "signup" => "users#new", :as => "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to:"sessions#create"
  get "logout", to: "sessions#destroy", as: "logout"
end


