Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }


  #provide the same routes but change in the show
  resources :portfolios, except:[:show]

  get 'angular-items', to: 'portfolios#angular' 

  get 'rails-items', to: 'portfolios#rails'
  
  get 'portfolio/:id', to: 'portfolios#show', as:'portfolio_show' #takes in the id parameter and maps to the show action


  #it shows if its portfolio/:id, route to portfolios#show
  
  get 'about-me', to: 'pages#about'
  get 'contact-me', to: 'pages#contact'
  

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  root to: 'pages#home'
end
