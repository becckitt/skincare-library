class Resolvers::CreateProduct < GraphQL::Function
  argument :name, !types.String

  type Types::ProductType

  def call(_obj, args, _ctx)
    Product.create!(
      name: args[:name]
    )
  end
end