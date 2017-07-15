Rails.application.routes.draw do

  resources :users

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions

  resources :posts do
    resources :comments
  end
  
  root 'posts#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
