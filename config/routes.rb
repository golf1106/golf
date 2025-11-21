Rails.application.routes.draw do
 devise_for :users
  resources :tweets
   root 'tweets#index'
   get "search", to: "tweets#search", as: "search"
end