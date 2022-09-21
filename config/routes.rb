Rails.application.routes.draw do
  devise_for :users
  root to: "items#index" 
  resources :items
  resources :purchases, only: [:index, :new, :create] do
    resources :destination, only: [:index, :new, :create]
  end
end
