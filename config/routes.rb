Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }


  #provide the same routes but change in the show
  resources :portfolios, except:[:show] do

    put :sort, on: :collection #when you see sort in the routes I want you to do diifferent thing

  end

  get 'angular-items', to: 'portfolios#angular' 

  get 'rails-items', to: 'portfolios#rails'
  
  get 'portfolio/:id', to: 'portfolios#show', as:'portfolio_show' #takes in the id parameter and maps to the show action


  #it shows if its portfolio/:id, route to portfolios#show
  
  get 'about-me', to: 'pages#about'
  get 'contact-me', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable' #allows to create websockets connection  

  root to: 'pages#home'

end


#WebSocket is a computer communications protocol, providing full-duplex communication channels over a single TCP connection.
