require File.expand_path('../../test_helper.rb', __FILE__)

class AnonymousUserControllerTest < ActionController::TestCase
  def setup
    user = Factory(:user)
    user.email = 'anonymous@2monki.es'
    assert user.save
  end
  
  context "copying publications" do
    should "set cookie" do
      pub = Factory(:publication)
      get :copy_publication, :id => pub.uuid
      assert_redirected_to anonymous_sign_in_path
      assert_equal pub.uuid, cookies['clone_publication_with_uuid']
    end
  end

  context "login" do
#     should "no parameters fail" do
#       get :login
#       assert_redirected_to anonymous_sign_in_path
#     end

#     should "verify captcha" do
#       get :login, { :recaptcha_challenge_field => "challenge", 
#         :recaptcha_response_field => "response"}
#       assert_template "exception_mailer/evilness_happened"
#     end
      
  end
end
