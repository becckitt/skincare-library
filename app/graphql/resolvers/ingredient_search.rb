require 'search_object/plugin/graphql'

class Resolvers::IngredientSearch
  include SearchObject.module(:graphql)

  scope { Ingredient.all }
  type !types[Types::IngredientType]

  IngredientFilter = GraphQL::InputObjectType.define do
    name 'IngredientFilter'

    argument :OR, -> { types[IngredientFilter] }
    argument :name_contains, types.String
  end

  option :filter, type: IngredientFilter, with: :apply_filter

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge(branches)
  end

  def normalize_filters(value, branches = [])
    scope = Ingredient.all
    scope = scope.where('lower(name) LIKE ?', "%#{value['name_contains'].downcase}%") if value['name_contains']
    
    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end