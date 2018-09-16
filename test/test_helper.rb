# RSpec.configure do |config|
#   config.expect_with :rspec do |expectations|
#     expectations.include_chain_clauses_in_custom_matcher_descriptions = true
#   end

#   config.mock_with :rspec do |mocks|
#     mocks.verify_partial_doubles = true
#   end

#   config.shared_context_metadata_behavior = :apply_to_host_groups
#   config.order = :random
#   Kernel.srand config.seed
# end
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'factory_bot_rails'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end

  # config.around(:each) do |example|
  #   begin
  #     DatabaseCleaner.cleaning do
  #       example.run
  #     end
  #   ensure
  #     DatabaseCleaner.clean
  #   end
  # end
end