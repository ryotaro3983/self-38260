Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root to: "posts#index"
  resources :posts
  resources :users, only: [:show, :edit, :update]
  resources :contents do
    resources :reviews
  end
end