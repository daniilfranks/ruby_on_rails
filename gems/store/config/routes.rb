Rails.application.routes.draw do
  root 'products#index'
  get '/cart', to: 'carts#index'
  post '/cart', to: 'carts#create'
  delete '/cart', to: 'carts#destroy'
  delete '/cart_items', to: 'cart_items#destroy'
  resources :cart_items
  resources :products
end
