Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :posts do
    resources :comments
  end

  devise_for :users
  resources :static_pages
  get  '/info', to: 'static_pages#info'

  root to: "static_pages#index"

  scope "(:locale)", locale: /en|ru/ do
    root to: 'static_pages#index'
  end
end
