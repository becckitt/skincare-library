require 'search_object/plugin/graphql'

class Resolvers::TagSearch
  include SearchObject.module(:graphql)

  scope { Tag.all }
  type !types[Types::TagType]

  TagFilter = GraphQL::InputObjectType.define do
    name 'TagFilter'

    argument :OR, -> { types[TagFilter] }
    argument :name_contains, types.String
  end

  option :filter, type: TagFilter, with: :apply_filter

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge(branches)
  end

  def normalize_filters(value, branches = [])
    scope = Tag.all
    scope = scope.where('lower(name) LIKE ?', "%#{value['name_contains'].downcase}%") if value['name_contains']
    
    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end