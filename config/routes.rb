Rails.application.routes.draw do
  root 'products#index'
  resources :products

  get '/wishlist' => 'products#wishlist'
end
