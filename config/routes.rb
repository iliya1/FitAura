Rails.application.routes.draw do

  devise_for :studios
  devise_for :trainers
  devise_for :users

  resources :studios do
    resources :classes do
      resources :timeslots
    end
    get "clients", to: "studios#clients", as: :clients
  end

  resources :trainers do
  end

  authenticated :studio do
    root 'studios#dashboard', as: :studio_root
  end

  authenticated :trainer do
    root 'trainers#dashboard', as: :trainer_root
  end

  authenticated :user do
    get "/account", to: "users#account", as: :user_account
    post "/book", to: "bookings#create", as: :book_class
    root 'users#home', as: :user_root
  end

  resources :charges

  root 'home#index'



end
