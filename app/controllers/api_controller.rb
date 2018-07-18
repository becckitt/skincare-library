class ApiController < ActionController::API
  # helper_method :current_user

  # # Includes user/auth-related functions
  # include AuthenticationConcern

  # Bootstrap jsonapi_suite with relevant modules
  include JsonapiSuite::ControllerMixin

  # before_action :authenticate_api

  # register_exception ActiveRecord::RecordNotFound,
  #                    code: :not_found,
  #                    status: 404,
  #                    title: 'Resource not found',
  #                    message: true

  # register_exception Error::NotFound,
  #                    code: :not_found,
  #                    status: 404,
  #                    title: 'Resource not found',
  #                    message: true

  # register_exception Error::Forbidden,
  #                    code: :forbidden,
  #                    status: 403,
  #                    title: 'Forbidden',
  #                    message: true

  # register_exception Error::Unauthorized,
  #                    code: :unauthorized,
  #                    status: 401,
  #                    title: 'Unauthorized',
  #                    message: true

  # Catch all other exceptions and render a JSONAPI-compliable error payload
  # For additional documentation, see https://jsonapi-suite.github.io/jsonapi_errorable
  # rescue_from Exception do |e|
  #   handle_exception(e)
  # end
end
