Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :businesses

  get '/', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'

  get '/signup', to: 'user#new', as: 'signup'
  post '/logout', to: 'sessions#destroy', as: 'logout'

  get '/business/:id', to: 'user#buy', as: 'user_buy_path'

end
