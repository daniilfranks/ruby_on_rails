Rails.application.routes.draw do
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  root 'static_pages#home'

  namespace :admin do
    root 'dashboard#index'
  end

  resources :categories
  resources :homeworks
  resources :tasks
  resources :projects
  resources :users
end
