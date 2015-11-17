Rails.application.routes.draw do

  devise_for :studios
  devise_for :trainers
  devise_for :users

  resources :studios do
    resources :classes, controller:"studios/classes"
    get "clients", to: "studios#clients", as: :clients
    resources :instructors
  end
  resources :studio_classes do
    resources :timeslots
  end

  resources :trainers do
    resources :locations
    resources :testimonials
    resources :certificates
    resources :classes, controller: "trainers/classes"
    get "clients", to: "trainers#clients", as: :clients
  end
  resources :trainer_classes do
    resources :timeslots
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


 namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users
    end
  end

end
