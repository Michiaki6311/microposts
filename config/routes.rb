Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup', to:'users#new'
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'setting', to: 'users#edit'
  post 'setting', to: 'users#update'
  # get 'followings/:id', to: 'users#followings'
  # get 'users/:id/followings'
  
  resources :users ,except: [:edit,:update] do
    member do
      get 'followings'
      get 'followers'
    end
  end
  resources :sessions,only: [:new,:create,:destroy]
  resources :microposts
  resources :relationships, only: [:create,:destroy]
end