Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :categories do
      resources :records
    end
  end
  # resources :records
  # resources :categories
  # resources :users
  
  root to: 'home#index'
end
