require File.expand_path('../../test_helper.rb', __FILE__)

class PublicationsControllerTest < ActionController::TestCase
  context "login first" do
    should "not allow anything except show" do
      (PublicationsController.action_methods - ["show"]).each do |action_name|
        get action_name.to_sym, :id => "fubar"
        assert_redirected_to new_user_session_url, "Failed for #{action_name}"
      end
    end
  end
end
