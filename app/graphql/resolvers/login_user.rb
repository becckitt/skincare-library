class Resolvers::LoginUser < GraphQL::Function
  argument :email, !types.String

  type do
    name 'LoginPayload'

    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, _ctx)
    email = args[:email]

    return unless email

    user = User.find_by(email: email)

    return unless user
  end
end