ProductInput = GraphQL::InputObjectType.define do
  name 'ProductInput'

  argument :name, !types.String
  argument :brand, !types.String
  argument :user, !types.String
  argument :wishlist, types.Boolean
  argument :comment, types.String
  argument :price_cents, types.Float
  argument :link, types.String
  argument :repurchase, types.String
  argument :rating, types.Int
  argument :product_type, types.String
  argument :ingredients, types.String
  argument :tags, types.String
end