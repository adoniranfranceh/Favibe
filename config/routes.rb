Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :events, only: [:show, :edit]
end
