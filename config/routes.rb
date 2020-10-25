Rails.application.routes.draw do
  root "houses#index"
  resources :houses
end
