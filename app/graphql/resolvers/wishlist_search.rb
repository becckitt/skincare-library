require 'search_object/plugin/graphql'

class Resolvers::WishlistSearch
  include SearchObject.module(:graphql)

  scope { Product.where(wishlist: true) }
  type !types[Types::ProductType]

  ProductFilter = GraphQL::InputObjectType.define do
    name 'ProductFilter'

    argument :OR, -> { types[ProductFilter] }
  end
end