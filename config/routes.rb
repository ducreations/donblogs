Rails.application.routes.draw do
  devise_for :users
  root to: 'blogs#index'
  
  get 'home/index'

  resources :blogs do
    resources :comments
  end
end
