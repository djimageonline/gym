Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "/exercises" => "exercises#index"
  # post "/exercises" => "exercises#create"
  # get "/exercises/:id" => "exercises#show"
  # patch "/exercises/:id" => "exercises#update"
  # delete "/exercises/:id" => "exercises#destroy"

  # exercise routes
  resources :exercises

  # user routes
  post "/users" => "users#create"

end

