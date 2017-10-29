Rails.application.routes.draw do
  devise_for :users
  
  root 'links#index'
<<<<<<< HEAD

  get 'tags/:tag', to: 'links#index', as: :tag
  resources :links, only: [:index, :new, :create, :edit, :update, :destroy]
  
=======

  get 'tags/:tag', to: 'links#index', as: :tag
  resources :links, only: [:index, :new, :create, :edit, :update, :destroy]

>>>>>>> 5ee1d34cf7739c9312ae55a6503bfa2d2c7b2098
end
