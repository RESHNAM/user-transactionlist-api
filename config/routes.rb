Rails.application.routes.draw do
	use_doorkeeper do
		skip_controllers :authorizations, :applications, :authorized_applications
	end
	# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

	# Defines the root path route ("/")
	# root "articles#index"
	resources :users do
		resources :transactions

	end

	post 'auth/login', to: 'authentication#authenticate'
	post 'signup', to: 'app_users#create'

	resources :apidocs, only: [:index]

	resources :swagger, only: [:index]
end
