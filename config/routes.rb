Rails.application.routes.draw do
  devise_for :users

  get 'requests/new', to: 'requests#new'
  get 'requests/listing', to: 'requests#listing'
  get 'requests/:id', to: 'requests#show'
  resources :requests, except: [:listing, :id]

  root 'requests#index'

  post 'profiles/new', to: 'profiles#create'
  post '/', to: 'profiles#create'
  resources :profiles do
    resources :feedbacks
  end


end
