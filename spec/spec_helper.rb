# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'airborne'
require 'dotenv'
Dotenv.load

Airborne.configure do |config|
  config.base_url = 'https://gateway.marvel.com:443/v1/public/'
end

RSpec.configure do |config|
  # Run in random order is a good practice to avoid test dependencies
  config.order = :random
  config.warnings = true
end
