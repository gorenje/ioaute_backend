require File.expand_path('../../test_helper.rb', __FILE__)

class PublicationsControllerTest < ActionController::TestCase
  context "login first" do
    should "not allow anything except show" do
      (PublicationsController.action_methods - ["show"]).each do |action_name|
        get action_name.to_sym, :id => "fubar"
        assert_redirected_to new_user_session_url, "Failed for #{action_name}"
      end
    end
    
    should "allow show" do
      get :show, :id => "fubar"
      assert_response :success
    end
  end
  
  context "editor_api" do
    should "be able to publish a publication" do
      
    end
    
    should "have a ping action" do
      sign_in :user, Factory(:user)
      get :ping, :format => :json
      assert_response :success
      obj = ActiveSupport::JSON.decode(response.body)
      assert_equal "ok", obj["status"]
      assert_equal "publications_ping", obj["action"]
    end
  end
end
