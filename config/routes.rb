Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  namespace :api do
    namespace :v1 do
      resources :products do
        resources :ingredients
      end
      get 'wishlist', to: 'products#wishlist'
      resources :routine
    end
  end

  post '/authenticate', to: 'authentication#authenticate'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  root to: 'welcome#index'
end
