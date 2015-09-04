Rails.application.routes.draw do
  devise_for :studios
  devise_for :trainers
  devise_for :users
  root 'home#index'
end
