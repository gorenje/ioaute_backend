require File.expand_path('../../test_helper.rb', __FILE__)

class PublicationTest < ActiveSupport::TestCase
  context "basics" do
    should "be able to create a page by page number" do
      pub = Factory(:publication)
      assert_difference "Page.count", 1 do
        page = pub.find_or_create_by_page_number(2)
        assert_equal 2, page.number
      end
      assert_difference "Page.count", 0 do
        page = pub.find_or_create_by_page_number(2)
        assert_equal 2, page.number
      end
    end
  end
end
