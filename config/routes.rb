Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :transactions

  end

  #get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')
end
