source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.3.4'
gem 'rails', '~> 5.2.0'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use Puma as the app server
gem 'puma', '~> 3.11'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# set up $$$$ support
gem 'money-rails'

# Setup app secific env variables
gem 'dotenv-rails'

gem 'actionmailer'

# GraphQL gems
gem 'graphql', '1.7.4'
gem 'graphiql-rails'
gem 'search_object', '1.2.0'
gem 'search_object_graphql', '0.1'

gem 'webpacker', '~> 3.5'
gem 'jwt'
gem 'redis'
gem 'redis-namespace'
gem 'httparty'

# might be able to get rid of this vv
gem 'simple_command'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'minitest-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'database_cleaner'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
