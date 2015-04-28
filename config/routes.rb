Rails.application.routes.draw do


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
