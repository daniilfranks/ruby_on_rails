# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'increment', to: :'urls#increment'
  resources :urls do
    get 'vip', on: :member #'/urls/1/vip'
    get 'vip', on: :collection #'/urls/vip'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'urls#index'
end
