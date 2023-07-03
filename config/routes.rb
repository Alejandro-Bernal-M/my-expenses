Rails.application.routes.draw do
  devise_for :users

  resources :records
  resources :categories
  resources :users
  
  root 'home#index'
end
