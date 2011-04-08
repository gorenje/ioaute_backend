require File.expand_path('../../test_helper.rb', __FILE__)

class PublicationsControllerTest < ActionController::TestCase
  context "login first" do
    should "not allow if user not logged in" do
      pub = Factory(:publication)
      PublicationsController::ActionMethodLookup.keys.each do |action_name|
        post :perform_action, { :id => pub.uuid, :action_to_perform => "#{action_name}" }
        assert_redirected_to new_user_session_url, "Failed for #{action_name}"
        assert_equal "created", pub.reload.state
      end
    end

    should "allow if user logged in" do
      user, pub = Factory(:user), Factory(:publication)
      pub.user = user
      pub.save
      sign_in user
      
      PublicationsController::ActionMethodLookup.keys.each do |action_name|
        post :perform_action, { :id => pub.uuid, :action_to_perform => "#{action_name}" }
        assert_redirected_to user_publications_path, "Failed for #{action_name}"
      end
    end
    
    should "allow show" do
      get :show, :id => "fubar"
      assert_response :success
      assert_template "common/publication_does_not_exist"
    end
  end
  
  context "edit" do
    should "render the editor when no id" do
      pub,user = setup_publication_and_user
      get :edit
      assert_response :success
      assert_template "editor", :layout => "editor"
    end
    
    should "render the edit page when id set" do
      pub,user = setup_publication_and_user
      get :edit, :id => pub.uuid
      assert_response :success
      assert_template "edit", :layout => "pubform"
    end
    
    should "update the publication and redirect on post" do
      pub,user = setup_publication_and_user
      pub.name, pub.topic = "fubar", "snafu"
      pub.save
      params = { 
        :id         => pub.uuid, 
        :name       => "Hello World", 
        :categories => "one,two,three", 
        :commit     => "Update"
      }
      post :edit, params
      assert_redirected_to user_publications_url
      assert_equal "Hello World", Publication.find(pub.id).name
      assert_equal "one,two,three", Publication.find(pub.id).topic
    end

    should "publication not found because commit wrong" do
      pub,user = setup_publication_and_user
      pub.name, pub.topic = "fubar", "snafu"
      pub.save
      params = { 
        :id         => pub.uuid, 
        :name       => "Hello World", 
        :categories => "one,two,three", 
        :commit     => "Edit"
      }
      post :edit, params
      assert_template "common/publication_does_not_exist"
      assert_equal "Hello World", Publication.find(pub.id).name
      assert_equal "one,two,three", Publication.find(pub.id).topic
    end

    should "render editor" do
      pub,user = setup_publication_and_user
      pub.name, pub.topic = "fubar", "snafu"
      pub.save
      params = { 
        :id         => pub.uuid, 
        :name       => "Hello World", 
        :categories => "one,two,three", 
        :commit     => "Start Editor"
      }
      post :edit, params
      assert_redirected_to open_editor_for_edit_path
      assert_equal "Hello World", Publication.find(pub.id).name
      assert_equal "one,two,three", Publication.find(pub.id).topic
    end
    
    should "don't update the publication if the user does not own publiation" do
      pub,user = setup_publication_and_user
      pub.name, pub.topic = "fubar", "snafu"
      pub.save
      user2 = Factory(:user)
      sign_in user2

      # ensure that we do the same thing on an edit as just update.
      ["Update", "Edit", "Fubar"].each do |commit_action|
        params = { 
          :id         => pub.uuid, 
          :name       => "Hello World", 
          :categories => "one,two,three", 
          :commit     => commit_action
        }
        post :edit, params
        assert_response :success
        assert_template "common/publication_does_not_exist"
        assert_equal "fubar", Publication.find(pub.id).name
        assert_equal "snafu", Publication.find(pub.id).topic
      end
    end

  end
  
  
  context "show" do
    should "not be shown if publication is deleted" do
      pub = Factory(:publication)
      pub.forget_it!
      get :show, :id => pub.uuid_base62
      assert_response :success
      assert_template "common/publication_does_not_exist"
    end
    
    should "be shown in various format" do
      pub = Factory(:publication)
      
      get :show, :id => pub.uuid, :format => :xml
      assert_response :success
      assert_template :format => :xml

      get :show, :id => pub.uuid, :format => :pdf
      assert_response :success
      assert_template :format => :pdf

      get :show, :id => pub.uuid
      assert_response :success
      assert_template "show", :layout => "publication"
    end
  end
  
  context "publish a publication" do
    should "only handle formay json" do
      sign_in Factory(:user)
      get :publish, :id => "fubar"
      assert_response :not_acceptable
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
      response.assert_json_content(:failed, "publications_publish", 
                                   "Couldn't find Publication with uuid = %s" % pub.uuid)
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
    should "fail if user is not logged in" do 
      user,pub = Factory(:user), Factory(:publication)
      pub.user = user
      assert pub.save
      
      get :ping, :id => pub.uuid, :format => :json
      assert_response 401 # not authorized
    end

    should "fail if user does not own the publication" do 
      user,pub = Factory(:user), Factory(:publication)
      pub.user = user
      assert pub.save
      
      sign_in :user, Factory(:user)
      get :ping, :id => pub.uuid, :format => :json
      assert_response :success
      
      response.assert_json_content(:failed, "publications_ping")
    end
    should "succeed if user is the author" do
      user,pub = Factory(:user), Factory(:publication)
      pub.user = user
      assert pub.save
      
      sign_in :user, user
      get :ping, :id => pub.uuid
      assert_response :not_acceptable # no format provided and no html format available
      
      get :ping, :id => pub.uuid, :format => :json
      assert_response :success
      
      data = response.assert_json_content(:ok, "publications_ping")["data"]
      [
       :facebook_app_id,       :flickr_api_key,       :tool_box_items,
       :toolbar_left,          :toolbar_middle,       :toolbar_right,
       :publication,           :tool_tips,
      ].map(&:to_s).each { |keyname| assert_not_nil data[keyname], "Key not found: #{keyname}" }

      assert_equal ["FlickrWindowControlItemIdentifier",
                    "TwitterWindowControlItemIdentifier",
                    "YouTubeToolbarItemIdentifier",
                    "GoogleImagesWindowControlItemIdentifier"], data["toolbar_middle"]
      assert_equal ["BackToPublicationsControlItemIdentifier",
                    "CopyPageElementControlItemIdentifier",
                    "PastePageElementControlItemIdentifier",
                    "PublicationPropertyControlItemIdentifier"], data["toolbar_left"]
      assert_equal ["PreviewPublicationHtmlToolbarItemIdentifier",
                    "PublishPublicationHtmlToolbarItemIdentifier"], data["toolbar_right"]
      
      assert_equal 24, data["tool_box_items"].count, "Too many/too few tool bar items"
      # ensure that the ids are unique
      assert_equal(24, data["tool_box_items"].collect { |a| a["id"] }.map(&:to_i).uniq.count,
                   "Tool bar item ids are not unique")
      assert_equal ApiKeys.facebook.api_id, data["facebook_app_id"]
      assert_equal ApiKeys.flickr.api_token, data["flickr_api_key"]

      pubdata = data["publication"]
      assert_equal 0, pubdata["snap_grid_width"]
      assert_equal 0, pubdata["continous"]
      assert_equal 1, pubdata["shadow"]
      assert_equal "Fubar", pubdata["name"]
      assert_equal 221, pubdata["color"]["red"]
      assert_equal 221, pubdata["color"]["blue"]
      assert_equal 221, pubdata["color"]["green"]
      assert_equal 1, pubdata["color"]["alpha"]
    end

    
    should "have facebook button if facebook user" do
      user,pub = Factory(:user), Factory(:publication)
      user.facebook_uid = 123
      assert user.save
      pub.user = user
      assert pub.save
      
      sign_in :user, user
      get :ping, :id => pub.uuid, :format => :json
      assert_response :success

      data = response.assert_json_content(:ok, "publications_ping")["data"]
      assert_equal ["FlickrWindowControlItemIdentifier",
                    "TwitterWindowControlItemIdentifier",
                    "FacebookToolbarItemIdentifier",
                    "YouTubeToolbarItemIdentifier",
                    "GoogleImagesWindowControlItemIdentifier"], data["toolbar_middle"]
    end
  end
end
