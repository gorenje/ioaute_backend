require File.dirname(__FILE__) + '/api_keys.rb'

Recaptcha.configure do |config|
  config.public_key  = ApiKeys.recaptcha.keys.public
  config.private_key = ApiKeys.recaptcha.keys.private
end
