Rails.application.routes.draw do
  devise_for :users
  get '/posts/info', to: 'posts#info'
  
  resources :posts do
    resources :comments
    patch :increment, on: :member
    get :info, on: :member
  end

  get '/create_post', to: 'posts#new', as: 'create_post'
  #get '/', to: redirect('https://danilababanov.ovh')
  root 'posts#index'
end
