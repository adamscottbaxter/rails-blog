Rails.application.routes.draw do

  devise_for :users
  resources :posts do 
  	resources :comments # can use rake routes to see the routes available
  end

  root "posts#index"

  get '/about', to: 'pages#about' # makes it so you dont have to go to /pages/about, but simply /about
end
