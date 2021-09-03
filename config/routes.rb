Rails.application.routes.draw do
  devise_for :users
  root to: 'blogs#index'
  
  get 'home/index'
  get 'users', to: 'users#index'

  resources :blogs do
    resources :comments
  end

end
