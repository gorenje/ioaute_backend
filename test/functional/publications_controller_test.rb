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
  
  context "publish a publication" do
    should "only handle formay json" do
      sign_in Factory(:user)
      get :publish, :id => "fubar"
      assert_response 406
    end

    should "error out of publication is not found" do
      Publication.delete_all
      sign_in Factory(:user)
      get :publish, :id => "fubar", :format => :json
      response.assert_json_content(:failed, "publications_publish", 
                                   "Couldn't find Publication with uuid = fubar")
    end

    should "error out if the publication does not belong to the currently logged in user" do
      user1, user2, pub = Factory(:user),Factory(:user),Factory(:publication)
      pub.user = user2
      pub.save
      
      sign_in user1
      get :publish, :id => pub.uuid, :format => :json
      response.assert_json_content(:failed, "publications_publish", "User not owner")
    end
    
    should "not request new bitly if already published" do
      pub,user = setup_publication_and_user
      pub.publish
      Publication.any_instance.expects(:generate_bitly).never
      Publication.any_instance.expects(:publish!).never
      Publication.any_instance.expects(:bitlies).once.returns(["one"])
      get :publish, :id => pub.uuid, :format => :json
      response.assert_json_content(:success, "publications_publish",nil, "one")
      assert Publication.find_by_uuid!(pub.uuid).published?
    end

    should "set to published and request bitly" do
      pub,user = setup_publication_and_user
      Publication.any_instance.unstub(:publish!)
      Publication.any_instance.expects(:generate_bitly).once.returns("two")
      Publication.any_instance.expects(:bitlies).never
      get :publish, :id => pub.uuid, :format => :json
      response.assert_json_content(:success, "publications_publish",nil, "two")
      assert Publication.find_by_uuid!(pub.uuid).published?
    end

    should "bitly can fail" do
      pub,user = setup_publication_and_user
      Publication.any_instance.expects(:generate_bitly).once.returns(nil)
      Publication.any_instance.expects(:bitlies).never
      get :publish, :id => pub.uuid, :format => :json
      response.assert_json_content(:failed, "publications_publish",
                                   "unable to publish at this time")
      assert Publication.find_by_uuid!(pub.uuid).editing?
    end
    
    should "handle publish! throwing an exception" do
      pub,user = setup_publication_and_user
      Publication.any_instance.expects(:publish!).raises( RuntimeError, "publish! failed")
      get :publish, :id => pub.uuid, :format => :json
      response.assert_json_content(:failed, "publications_publish","publish! failed")
      assert Publication.find_by_uuid!(pub.uuid).created?
    end
  end

  context "ping" do
    should "have a ping action" do
      sign_in :user, Factory(:user)
      get :ping
      assert_response 406 # no format provided and no html format available
      
      get :ping, :format => :json
      assert_response :success
      
      response.assert_json_content(:ok, "publications_ping")
    end
  end
end
