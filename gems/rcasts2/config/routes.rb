Rails.application.routes.draw do
  root 'static_pages#home'

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
end
