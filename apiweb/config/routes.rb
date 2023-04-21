Rails.application.routes.draw do
  # Users routing
  root 'users#index'
  post 'u/plogin' => 'users#process_login'
  post 'u/pregister' => 'users#process_register'
  get 'u/:username' => 'users#profile'
  get 'u/forgot_password' => 'users#forgot_password'
  post 'u/pfp' => 'users#process_forgot_password'
  get 'u/logout' => 'users#logout'

  # Admin routing
  get 'admin' => 'admin#index'
  post 'pal' => 'admin#process_login'
  get 'categories' => 'admin#categories'
  get 'categories/:id/view' => 'admin#show_category'
  get 'categories/new' => 'admin#new_category'
  post 'categories' => 'admin#create_category'
  get 'categories/:id/edit' => 'admin#edit_category'
  put 'categories/:id' => 'admin#update_category'
  get 'activities' => 'admin#activities'
  get 'activities/:id/view' => 'admin#show_activity'
  get 'activities/new' => 'admin#new_activity'
  post 'activities' => 'admin#create_activity'
  get 'activities/:id/steps/new' => 'admin#new_activity_step'
  post 'activities/:id/steps' => 'admin#create_activity_step'
  get 'activities/:id/edit' => 'admin#edit_activity'
  put 'activities/:id' => 'admin#update_activity'
  get 'activitysteps/:id' => 'admin#edit_activity_step'
  put 'activitysteps/:id' => 'admin#update_activity_step'
  get 'activitysteps/:id/destroy' => 'admin#delete_activity_step'
  get 'admin/logout'

  namespace :api do
    namespace :v1 do
      # Activities API routing
      get 'activities' => 'activities#index'
      get 'activities/:id' => 'activities#show'
      post 'activities' => 'activities#create'
      put 'activities/:id' => 'activities#update'
      delete 'activities/:id' => 'activities#delete'

      # Categories API routing
      get 'categories' => 'categories#index'
      get 'categories/:id' => 'categories#show'
      post 'categories' => 'categories#create'
      patch 'categories/:id' => 'categories#update'

      # Users API routing
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
