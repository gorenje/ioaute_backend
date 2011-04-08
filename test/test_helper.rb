ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require File.expand_path('../factories.rb', __FILE__)

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
  
  def setup_publication_and_user
    user, pub = Factory(:user),Factory(:publication)
    pub.user = user
    pub.save
    sign_in user
    [pub,user]
  end
end

class ActionController::TestResponse
  include Test::Unit::Assertions
  
  def assert_json_content(failed_or_success, action, msg = nil, data = nil)
    obj = ActiveSupport::JSON.decode(self.body)
    assert_equal(failed_or_success == :failed ? "failed" : "ok", obj["status"], 
                 "Failed status: %s" % self.body)
    assert_equal(action, obj["action"],"Failed action: %s" % self.body)
    assert_equal(msg, obj["msg"],"Failed msg %s" % self.body) unless msg.nil?
    assert_equal(data, obj["data"], "Failed data %s" % self.body) unless data.nil?
    obj
  end
end
