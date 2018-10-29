require 'search_object/plugin/graphql'

class Resolvers::WishlistSearch
  include SearchObject.module(:graphql)

  scope { Product.where(wishlist: true) }
  type !types[Types::ProductType]

  WishlistFilter = GraphQL::InputObjectType.define do
    name 'WishlistFilter'

    argument :OR, -> { types[WishlistFilter] }
    argument :user_contains, types.String
  end

  option :filter, type: WishlistFilter, with: :apply_filter

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge(branches)
  end

  def normalize_filters(value, branches = [])
    scope = Product.where(wishlist: true)
    scope = scope.where('lower(user) LIKE ?', "%#{value['user_contains'].downcase}%") if value['user_contains']
    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end