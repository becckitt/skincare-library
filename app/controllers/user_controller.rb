class UserController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    user = User.find_or_create_by(email: params['email'])
    token = JsonWebToken.decode(params['token'])
    render json: { token: token }
  end
end