Rails.application.routes.draw do
  devise_for :users
  root "tops#index"
  resources :houses
  resource :users, only: :show
  resource :areas
end
