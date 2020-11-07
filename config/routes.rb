Rails.application.routes.draw do
  devise_for :users
  root "tops#index"
  resources :houses do
    resource :clips,only: [:create,:destroy]
    resources :comments
  end
  resource :users, only: [:show] do
    collection do
      get :clips
      get :comments
    end
  end
  resource :areas
end
