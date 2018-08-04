Types::IngredientType = GraphQL::ObjectType.define do
  name 'Ingredient'

  field :id, !types.ID
  field :name, !types.String
  field :products, !types[Types::ProductType]
end