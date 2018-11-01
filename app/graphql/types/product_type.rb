Types::ProductType = GraphQL::ObjectType.define do
  name 'Product'

  field :id, !types.ID
  field :name, !types.String
  field :brand, !Types::BrandType
  field :user, !Types::UserType
  field :wishlist, types.Boolean
  field :comment, types.String
  field :price_cents, types.Float
  field :link, types.String
  field :repurchase, types.String
  field :rating, types.Int
  field :product_type, types.String
  field :ingredients, types[Types::IngredientType]
  field :tags, types[Types::TagType]
end