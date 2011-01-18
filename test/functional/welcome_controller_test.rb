require File.expand_path('../../test_helper.rb', __FILE__)

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
end
