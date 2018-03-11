Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get 'tweets/personal', to: 'tweets#personal'

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  # resources :users, only: [:index, :show]
  resources :tweets
end