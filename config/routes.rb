Rails.application.routes.draw do
  
  # route to users information list
  root :to => 'visitors#index'
  
  # route incorrectly to /views/index.html.erb
  #root to: 'application#index'

  devise_for :users

  resources :users
  resources :todos
end
