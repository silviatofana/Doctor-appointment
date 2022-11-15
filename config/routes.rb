Rails.application.routes.draw do
  resources :appointments
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :appointments
      end
      post 'auth/login/', to: 'authentication#login'
      resources :doctors, only: [:create, :index, :update, :destroy]
      
    end
  end 
end
