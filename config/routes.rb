Rails.application.routes.draw do
  root 'welcome#home'
  get '/about',   to: 'welcome#about'
  get  '/signup',  to: 'users#new'
  
  resources :users
end