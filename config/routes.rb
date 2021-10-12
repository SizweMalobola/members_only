Rails.application.routes.draw do
    root 'posts#home'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    resources :posts, only: [:new, :create, :index, :show]
    resources :users, only: [:new, :create]
    # resources :sessions, only: [:new, :create,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
