require 'redis'
require 'redis-namespace'
require 'httparty'
require 'jwt'

require 'exceptions/no_certificates_error'
require 'exceptions/certificates_request_error'
require 'exceptions/certificates_ttl_error'
require 'configuration'
require 'certificates'
require 'signature'

module FirebaseIdToken
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end 

  # Resets Configuration to defaults.
  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield configuration
  end
end

FirebaseIdToken.configure do |config|
  config.project_ids = ['skincare-library-c0019']
end