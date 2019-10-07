Rails.application.routes.draw do
  get 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :lists
  resources :comments, only: %i[create destroy]
  resources :users, only: %i[new create]
  get 'all_lists', to: 'lists#all_index'
end
