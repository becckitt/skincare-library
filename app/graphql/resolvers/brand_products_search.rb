require 'search_object/plugin/graphql'

class Resolvers::BrandProductsSearch
  include SearchObject.module(:graphql)

  scope { Brand }
  type !types[Types::BrandType]
end