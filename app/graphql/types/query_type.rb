Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allProducts, function: Resolvers::ProductsSearch
  field :brandProducts, function: Resolvers::BrandProductsSearch
end
