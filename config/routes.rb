Rails.application.routes.draw do
  devise_for :users
  
  root to: "links#index"

  get 'tags/:tag', to: 'links#index', as: :tag
  resources :links, only: [:index, :new, :create, :edit, :update, :destroy]
  
end
