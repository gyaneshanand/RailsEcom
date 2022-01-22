Rails.application.routes.draw do

  # require 'sidekiq/web'
  # mount Sidekiq::Web => "/sidekiq"

  post '/login' , to: 'sessions#login'
  get '/logout' , to: 'sessions#logout'
  # get 'product/index'
  # get 'product/create'
  # get 'product/new'
  # get 'product/destroy'
  # get 'product/show'

  resources :product
  resources :user
  resources :product_category
  resources :seller_catalog
  resources :order
end
