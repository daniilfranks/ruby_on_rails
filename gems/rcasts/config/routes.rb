Rails.application.routes.draw do
  resources :homeworks
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  namespace :admin do
    root 'dashboard#index'
  end

  resources :tasks
  resources :projects
  resources :users
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  root 'static_pages#home'
end
