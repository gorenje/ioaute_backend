# -*- ruby -*-
source 'http://rubygems.org'

gem 'rails', '3.0.3'

gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'haml'
gem 'haml-rails'
gem 'devise'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'capistrano-ext'

gem "state_machine"
gem 'uuidtools'

gem "prawn", "= 0.11.1.pre"

gem 'mysql'
# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

group :test do
  gem 'rspec', "= 1.3.0"
  gem 'mocha'
  gem 'rspec-rails', "= 1.3.2"
  gem 'factory_girl'
  gem 'shoulda'
end

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :console do
  gem 'wirble'
  gem "looksee"
end
