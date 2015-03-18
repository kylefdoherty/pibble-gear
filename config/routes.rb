Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :products do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
  end
end
