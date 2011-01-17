require File.dirname(__FILE__) + '/api_keys.rb'

Devise::FacebookConnectable.setup do |config|
  config.api_id    = ApiKeys.facebook.api_id
  config.api_token = ApiKeys.facebook.api_token
  config.secret    = ApiKeys.facebook.secret
end

