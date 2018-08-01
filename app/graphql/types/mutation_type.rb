Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createProduct, function: Resolvers::CreateProduct.new
  field :createUser,    function: Resolvers::CreateUser.new
  field :signInUser,    function: Resolvers::SignInUser.new
end
