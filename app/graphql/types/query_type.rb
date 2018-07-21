Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allProducts, function: Resolvers::ProductsSearch
end
