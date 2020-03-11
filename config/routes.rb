Rails.application.routes.draw do
  devise_for :users
  root "categorys#index"
  resources :categorys, only: [:index, :new, :create,:show]
  resources :posts, only: [:index, :new, :create,:show,:edit,:update]
end
