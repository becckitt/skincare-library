Types::BrandType = GraphQL::ObjectType.define do
  name 'Brand'

  field :id, !types.ID
  field :name, !types.String
  field :products, !types[Types::ProductType]
end