class UserController < ApplicationController
  def authenticate
    # save user by email & token here
    render json: { email: params['email'], token: params['jwt'] }
  end
end