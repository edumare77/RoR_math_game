Rails.application.routes.draw do
  get 'welcome/home'
  get 'welcome/about'
  root 'application#hello'
end