Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: "home#index"
  get "home" => "home#index"

  get "goodcause/:id" => "goodcause#show"
  post "goodcause/create"

  get "technologists/:id" => "technologists#show", as: 'technologist'
  post "technologists/create"
  post "technologists/update"

  get '/auth/:provider/callback', to: 'sessions#create'
  get "logout" => "sessions#destroy", :as => "logout"
  resources :sessions
end
