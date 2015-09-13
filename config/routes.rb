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
    root 'users#home', as: :user_root
  end

  resources :charges

  root 'home#index'


end
