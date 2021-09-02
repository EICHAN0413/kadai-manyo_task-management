Rails.application.routes.draw do

  resources :labels
  namespace :admin do
    resources :users
  end

  root 'tasks#index'
 
  resources :tasks do 
    collection do
      get :search
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

end