Rails.application.routes.draw do
  get 'mypage', to: 'users#me'
  # post用も用意できるっぽい。postじゃないと画像のurlが送られない・・・
  post 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'edit_user', to: 'users#edit'
  post 'list_details', to: 'lists#details'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 上の定義と合わせてこっちも修正しないと遷移できない！
  root 'home#index'
  resources :lists
  resources :comments, only: %i[create destroy]
  resources :users, only: %i[new create edit] 
  resources :relationships, only: [:create, :destroy]
  get 'all_lists', to: 'lists#all_index'
end
