Rails.application.routes.draw do
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
