Rails.application.routes.draw do
  devise_for :users
  root to: 'blogs#index'

  resources :blogs do
    resources :comments
  end
end
