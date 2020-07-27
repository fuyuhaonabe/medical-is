Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  root to: "interviews#index"

  resources :profiles do
  end

  resources :interviews do
    collection do
      get :complete
      get :mypage
    end
  end
  
end
