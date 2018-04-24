Rails.application.routes.draw do
  root to: 'pages#home'

  resources :portfolios
  
  get 'about-me', to: 'pages#about'
  get 'contact-me', to: 'pages#contact'

  resources :blogs
   
end
