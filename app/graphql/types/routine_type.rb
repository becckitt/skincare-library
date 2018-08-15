Types::RoutineType = GraphQL::ObjectType.define do
  name 'Routine'

  field :id, !types.ID
  field :time_of_day, types.Int
  field :products, types[Types::ProductType]
end