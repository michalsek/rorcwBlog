Rails.application.routes.draw do


  resources :comments

  resources :posts do
    collection do
      get :recent
    end
    member do

    end
  end
  root to: "posts#index"
end
