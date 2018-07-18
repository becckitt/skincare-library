Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :products do
        resources :ingredients
      end
      get 'wishlist', to: 'products#wishlist'
      resources :routine
    end
  end

  root to: 'welcome#index'
end
