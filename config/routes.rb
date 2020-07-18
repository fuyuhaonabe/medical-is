Rails.application.routes.draw do
  devise_for :users
  root to: "interviews#index"
  
  resources :users, only: [:index, :edit, :update]

end
