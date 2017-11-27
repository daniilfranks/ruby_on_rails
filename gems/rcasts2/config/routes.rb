Rails.application.routes.draw do
  get 'moderator', to: 'moderator#index'
  get 'moderator/users', to: 'moderator#users'

  resources :post_tags
  resources :tags
  resources :categories
  root 'static_pages#home'

  get  'products', to: 'products#index'
  post 'products', to: 'products#add'
  delete 'products', to: 'products#destroy'

  get "students/:id/activate", to: 'students#activate', as: 'activate_student'
  get 'votes/create'

  get    'signup', to: 'users#new'
  get    'login',  to: 'session#new'
  post   'login',  to: 'session#create'
  delete 'logout', to: 'session#destroy'

  get 'session/destroy'

  resources :posts
  resources :students
  resources :users
  resources :articles do
    patch 'votes', to: 'votes#create'
  end

  namespace :admin do
    resources :stats, only: [:index]
  end
end
