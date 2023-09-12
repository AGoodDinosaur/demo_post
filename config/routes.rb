Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations', passwords: 'user/passwords',
  sessions: 'user/sessions'}
  root 'main#home'


  resources :posts do 
    resources :comments
  end 

  # resources :like, only: [:create, :destroy]
  post '/likes/action', to: "likes#action"

  delete "/posts/:id", to: "posts#destroy"
  # root "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path rou te ("/")
  # root "articles#index"
end
