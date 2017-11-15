Rails.application.routes.draw do
  resources :tasks
  resources :projects
  resources :users
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
