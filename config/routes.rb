Rails.application.routes.draw do
  get 'home/index'
  resources :tasks do
		member do
			post :inspect
			post :snooze
		end
	end

  resources :zones
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
	root "home#index"
end
