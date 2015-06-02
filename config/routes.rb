Rails.application.routes.draw do
  
  resources :events do
    resources :comments
  end

  resources :questions

  get "sign_up" => "users#new", as: "sign_up"
  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create", as: "loginuser"
  get "logout" => "sessions#destroy", as: "logout"
  
  resources :users, except: [:new] do
    resources :comments
  end
  
  resources :categories

  resources :posts do
    collection do
      get :recent
      get :all
    end
    
    resources :comments
  end
  root to: "posts#index"
end
