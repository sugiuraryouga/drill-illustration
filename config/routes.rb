Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root "categorys#index"
  resources :categorys, only: [:index, :new, :create,:show]
  resources :posts, only: [:index, :new, :create,:show,:edit,:update] do
    collection do
      get 'search'
    end  
    # 7つのアクションのみで作りたい場合はcontrolerに新しいディレクトリ rails g controller tweets::searches（検索する対象・・・今回ならpostsディレクトリを作ってsearches_controller.rbを設置）
    # 上のcollection の代わりに下記を利用
    # namespace :tweets do
    #   resources :searches, only: :index
    # end
  end
end
