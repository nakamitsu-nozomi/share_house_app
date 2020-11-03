Rails.application.routes.draw do
  devise_for :users
  root "tops#index"
  resources :houses do
    resource :clips,only: [:create,:destroy]
  end
  resource :users, only: :show
  resource :areas
end
