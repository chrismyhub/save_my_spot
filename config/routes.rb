Rails.application.routes.draw do
  get 'profiles/index'
  get 'profiles/show'
  devise_for :users
  root 'requests#index'

  resources :users
  resources :profiles
end
