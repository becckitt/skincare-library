Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allProducts, function: Resolvers::ProductsSearch
  field :brandSearch, function: Resolvers::BrandSearch
  field :ingredientSearch, function: Resolvers::IngredientSearch
  field :tagSearch, function: Resolvers::TagSearch
  field :routineSearch, function: Resolvers::RoutineSearch
end
