require File.dirname(__FILE__) + '/api_keys.rb'

Devise::Twitter.setup do |config|
  config.consumer_key = ApiKeys.twitter.oauth.consumer.key
  config.consumer_secret = ApiKeys.twitter.oauth.consumer.secret
  config.scope = :user
end

