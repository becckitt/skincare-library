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

    # get token from firebase
    # decrypt it according to firebase's reccs
    # jwt has the user id info
    # need to add a firebase_id column
    # and check it against that
  end
end