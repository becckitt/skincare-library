require 'search_object/plugin/graphql'

class Resolvers::RoutineSearch
  include SearchObject.module(:graphql)

  scope { Routine.all }
  type !types[Types::RoutineType]

  RoutineFilter = GraphQL::InputObjectType.define do
    name 'RoutineFilter'

    argument :OR, -> { types[RoutineFilter] }
    argument :id_contains, types.String
  end

  option :filter, type: RoutineFilter, with: :apply_filter

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge(branches)
  end

  def normalize_filters(value, branches = [])
    scope = Routine.all
    scope = scope.where(id: value['id_contains']) if value['id_contains']
    
    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end