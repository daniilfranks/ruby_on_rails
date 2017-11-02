Rails.application.routes.draw do

  scope "/:locale" do
    resources :tasks do
      resources :comments, only: [:create]
    
      member do
        patch :toggle
      end
    end

    resources :projects
  end
  
  root 'projects#index'
end
