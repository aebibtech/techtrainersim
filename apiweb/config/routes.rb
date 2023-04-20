Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Activities API routes
      get 'activities' => 'activities#index'
      get 'activities/:id' => 'activities#show'
      post 'activities' => 'activities#create'
      put 'activities/:id' => 'activities#update'
      delete 'activities/:id' => 'activities#delete'

      # Categories API routes
      get 'categories' => 'categories#index'
      get 'categories/:id' => 'categories#show'
      post 'categories' => 'categories#create'
      patch 'categories/:id' => 'categories#update'

      # Users API routes
      get 'users/:username' => 'users#show'
      get 'users/:username/progresses' => 'users#learning_progresses'
      post 'users' => 'users#create'
      patch 'users/:username/update_bio' => 'users#update_bio'
      patch 'users/:username/update_stars' => 'users/#update_stars'
      post 'users/login' => 'users#login'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
