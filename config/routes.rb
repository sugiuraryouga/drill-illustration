Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root "categorys#index"
  resources :categorys, only: [:index, :new, :create,:show]
  resources :posts, only: [:index, :new, :create,:show,:edit,:update] do
    collection do
      get 'search'
    end  
  end
end
