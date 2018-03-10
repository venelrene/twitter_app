Rails.application.routes.draw do
  resources :tweets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  # resources :users, only: [:index, :show]

end