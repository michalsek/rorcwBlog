Rails.application.routes.draw do
  
  get "sign_up" => "users#new", as: "sign_up"
  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create", as: "loginuser"
  get "logout" => "sessions#destroy", as: "logout"
  
  resources :users, except: [:new] do
    
  end
  
  resources :categories

  resources :comments

  resources :posts do
    collection do
      get :recent
      get :all
    end
    member do

    end
  end
  root to: "posts#index"
end
