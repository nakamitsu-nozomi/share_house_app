Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: "users/registrations",
    passwords: "users/passwords"
  }

  root "tops#index"

  resources :houses do
    resource :clips,only: [:create,:destroy]
    resources :comments do
      resource :clips,only: [:create,:destroy]
    end
    resources :rooms,only: [:create,:destroy,:new,:edit,:update]
    member do
      get "map"
      get "room"
    end
  end

  resource :users, only: [:show] do
    collection do
      get :clips
      get :comments
    end
  end

  resource :areas
  devise_scope :user do
     post 'users/guest_sign_in', to: 'users/sessions#new_guest' 
  end
  get '*path', controller: 'application', action: 'render_404'
end
