Rails.application.routes.draw do
  resources :tasks
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  get 'home/index'
  root 'tasks#index'
end
