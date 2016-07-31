Rails.application.routes.draw do

  resources :posts do 
  	resources :comments # can use rake routes to see the routes available
  end

  root "posts#index"
end
