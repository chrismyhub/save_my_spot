Rails.application.routes.draw do
  devise_for :users
  root 'requests#index'

  post 'profiles/new', to: 'profiles#index'
  resources :users
  resources :profiles
end
