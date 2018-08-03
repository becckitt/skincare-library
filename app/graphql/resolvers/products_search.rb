require 'search_object/plugin/graphql'

class Resolvers::ProductsSearch
  include SearchObject.module(:graphql)

  scope { Product.all }
  type !types[Types::ProductType]

  ProductFilter = GraphQL::InputObjectType.define do
    name 'ProductFilter'

    argument :OR, -> { types[ProductFilter] }
    argument :name_contains, types.String
    argument :id_contains, types.ID
  end

  option :filter, type: ProductFilter, with: :apply_filter

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge(branches)
  end

  def normalize_filters(value, branches = [])
    scope = Product.all
    scope = scope.where('lower(name) LIKE ?', "%#{value['name_contains'].downcase}%") if value['name_contains']
    scope = scope.where("id = #{value['id_contains']}") if value['id_contains']
    
    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end