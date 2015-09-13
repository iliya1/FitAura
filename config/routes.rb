Rails.application.routes.draw do

  devise_for :studios
  devise_for :trainers
  devise_for :users

  resources :studios do
    member do
      get "dashboard"
    end
    resources :classes do
      resources :timeslots
    end
  end

  authenticated :studio do
    root 'studios#dashboard', as: :studio_root
  end

  authenticated :user do
    get "/account", to: "users#account", as: :user_account
    post "/book/:timeslot_id", to: "users#book", as: :book_class
    root 'users#home', as: :user_root
  end

  resources :charges

  root 'home#index'


end
