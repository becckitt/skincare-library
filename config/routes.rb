Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
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

  # if Rails.env.development?
  #   mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'

  #   root to: redirect('/graphiql')
  # end

  root to: 'welcome#index'
end
