Rails.application.routes.draw do
  namespace :settings do
    resource :user, only: [:show, :update]
  end
  devise_for :users
  root to: 'home#index'
  resources :timelines, only: [:index, :show], param: :username
  resources :posts, only: [:create, :show]

  resources :bonds, param: :username do
    member do
      post :follow
      post :unfollow
      get :followers
      get :following
      post :accept
      post :reject
    end
  end

  namespace :api do
    namespace :v1 do
      resources :places, only: [:index]
    end
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
