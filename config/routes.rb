Rails.application.routes.draw do
  
  get 'toppages/index'
  root to: 'toppages#index'
  
  get 'questions/index'
  resources :inquiries, only: [:new, :create]
  get 'introductions/index'
  get 'jobs/index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    get :search, on: :collection
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  resources :words, only:[:show, :create, :edit, :update, :destroy] do
    collection do
      get :eiken
      get :toeic
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  
  resources :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
