Rails.application.routes.draw do
  resources :tasks
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  post 'api' => 'api#index', :defaults => { :format => 'json' }
  root 'tasks#index'
end
