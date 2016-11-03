Rails.application.routes.draw do
  
  root 'welcome#home'
  get '/about',   to: 'welcome#about'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #get    '/game',   to: 'arithmetics#new'
  #post   '/game',   to: 'arithmetics#create'
  resources :users
  resources :arithmetics
end