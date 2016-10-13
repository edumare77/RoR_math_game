Rails.application.routes.draw do
  root 'welcome#home'
  get 'sessions/new'
  get '/about',   to: 'welcome#about'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end