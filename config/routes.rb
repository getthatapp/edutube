Rails.application.routes.draw do
  devise_for :users
  
  root 'links#index'

  resources :links, only: [:index, :new, :create, :edit, :update, :destroy]
end
