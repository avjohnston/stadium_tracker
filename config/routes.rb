Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :index] do 
    resources :dashboard, only: [:index]
    resources :trips
    resources :stadiums
    resources :games
  end
end
