Rails.application.routes.draw do
  devise_for :users
  root "categorys#index"
  resources :categorys, only: [:index, :new, :create]
  resources :posts, only: [:index, :new, :create,:show]
end
