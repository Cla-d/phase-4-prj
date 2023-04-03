Rails.application.routes.draw do
  resources :movie_actors
  resources :actors
  resources :directors
  resources :reviews
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
