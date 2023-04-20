Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
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
