Rails.application.routes.draw do
  root 'static_pages#home'

  get 'votes/create'

  get    'signup', to: 'users#new'
  get    'login',  to: 'session#new'
  post   'login',  to: 'session#create'
  delete 'logout', to: 'session#destroy'

  get 'session/destroy'

  resources :users
  resources :articles do
    patch 'votes', to: 'votes#create'
  end
end
