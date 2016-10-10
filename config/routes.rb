Rails.application.routes.draw do
  root 'welcome#home'
  get 'users/new'
  get 'welcome/home'
  get 'welcome/about'
    resources :users
end