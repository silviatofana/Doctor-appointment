Rails.application.routes.draw do
  devise_for :users

  resources :users
     post 'auth/login/', to: 'authentication#login'


     namespace :api, defaults: { format: :json } do
      namespace :v1 do
        resources :doctors, only: [:index, :create, :destroy, :show, :update]
        
      end
    end




end
