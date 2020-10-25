Rails.application.routes.draw do
  devise_for :users
  root "houses#index"
  resources :houses
  resource :users, only: :show
end
