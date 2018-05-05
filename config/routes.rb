Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :products do
        resources :ingredients
      end
      resources :wishlists
    end
  end

  root to: 'products#index'
end
