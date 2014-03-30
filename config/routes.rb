ProjectCurrently::Application.routes.draw do
  resources :support_requests

  resources :comments

  resources :projects

  resources :users

  root "users#new"

  get "login", to: "sessions#new", as: "login"
  post "login", to:"sessions#create"

  get "logout", to: "sessions#destroy", as: "logout"
end
