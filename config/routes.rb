Rails.application.routes.draw do
  resources :themes
  resources :names
  resources :tasks
  resources :zones
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
	root "zones#index"
end
