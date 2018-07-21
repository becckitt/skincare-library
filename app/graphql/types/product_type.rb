Types::ProductType = GraphQL::ObjectType.define do
  name 'Product'

  field :id, !types.ID
  field :name, !types.String
  field :comment, types.String
  field :price_cents, types.String
  field :link, types.String
  field :repurchase, types.Int
  field :product_type, types.Int
  field :wishlist, types.Boolean
  field :brand, !Types::BrandType
  field :user, !Types::UserType
end