require File.expand_path('../../test_helper.rb', __FILE__)

class UserTest < ActiveSupport::TestCase
  context "facebook conntected" do
    should "normal non FB user is not connected" do
      assert !Factory(:user).facebook_connected?
    end
    
    should "be connected if FB UID set" do
      user = Factory(:user)
      user.facebook_uid = 123
      user.facebook_session_key = nil
      assert user.facebook_connected?

      user.facebook_uid = 123
      user.facebook_session_key = "1213"
      assert user.facebook_connected?

      user.facebook_uid = nil
      user.facebook_session_key = "1213"
      assert !user.facebook_connected?
    end
  end
end
