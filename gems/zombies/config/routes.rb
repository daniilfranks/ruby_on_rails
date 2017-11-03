Rails.application.routes.draw do
  resources :posts do
    resources :comments
    patch :increment, on: :member
  end
  
  root 'posts#index'
end
