Rails.application.routes.draw do
  resources :posts do
    resources :comments
    patch :increment, on: :member
  end
  
  get '/create_post', to: 'posts#new', as: 'create_post'
  #get '/', to: redirect('https://danilababanov.ovh')
  root 'posts#index'
end
