Rails.application.routes.draw do
  devise_for :users #html
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
  	namespace :v1 do
  		resources :users, only: [:create, :show, :update, :destroy]
  		resources :sessions, only: [:create]
  		resources :posts, only: [:create, :index]
  	end
  end


end
