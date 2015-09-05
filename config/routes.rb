Rails.application.routes.draw do
  devise_for :studios
  devise_for :trainers
  devise_for :users

  resources :studios do
    member do
      get "dashboard"
      get "schedule"
    end
  end

  devise_scope :studio do
    root 'studios#dashboard', as: :studio_root
  end


  root 'home#index'

end
