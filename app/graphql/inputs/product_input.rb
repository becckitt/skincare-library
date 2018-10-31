ProductInput = GraphQL::InputObjectType.define do
  name("ProductInput")
  argument :name, !types.String
  argument :brand, !types.String
  argument :user, !types.String
  argument :wishlist, types.String
  argument :comment, types.String
  argument :price_cents, types.String
  argument :product_type, types.String
  argument :link, types.String
  argument :rating, types.String
  argument :repurchase, types.String
  argument :ingredients, types.String
  argument :tags, types.String
end