class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    # command = AuthenticateUser.call(params[:email])

    # if command.success?
    #   render json: { auth_token: command.result }
    # else
    #   render json: { error: command.errors }, status: :unauthorized
    # end
    user = User.find_or_create_by(email: params['email'])
    token = JsonWebToken.decode(params['token'])
    render json: { token: token }
  end

  def authenticate_user
    user = User.find_or_create_by(email: params['email'])
    token = JsonWebToken.decode(params['token'])
    render json: { token: token }
    # user.save!
  end
end
