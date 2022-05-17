Rails.application.routes.draw do
  devise_for :users
  root 'requests#index'

  # resources :users

  post 'profiles/new', to: 'profiles#create'
  post '/', to: 'profiles#create'
  resources :profiles do
    resources :feedbacks
  end


end
