Rails.application.routes.draw do
  root 'products#index'

  get '/products/myrequest', to: 'products#myrequest'

  namespace :admin do
    resources :products
  end

  get '/cart', to: 'carts#index'
  post '/cart', to: 'carts#create'
  delete '/cart', to: 'carts#destroy'
  delete '/cart_items', to: 'cart_items#destroy'

  resources :orders
  resources :cart_items
  resources :products
end
