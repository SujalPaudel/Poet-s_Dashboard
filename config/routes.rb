Rails.application.routes.draw do
  root to: 'pages#home'

  #provide the same routes but change in the show
  resources :portfolios, except:[:show]
  
  get 'portfolio/:id', to: 'portfolios#show', as:'portfolio_show'

  #it shows if its portfolio/:id, route to portfolios#show
  
  get 'about-me', to: 'pages#about'
  get 'contact-me', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
   
end
