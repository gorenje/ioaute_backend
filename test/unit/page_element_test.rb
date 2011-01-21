require File.expand_path('../../test_helper.rb', __FILE__)

class PageElementTest < ActiveSupport::TestCase

  LookupMap = { 
    "Facebook"      => FacebookElement,
    "Tweet"         => TwitterElement,
    "Flickr"        => FlickrElement,
    "ImageTE"       => ImageElement,
    "LinkTE"        => LinkElement,
    "TextTE"        => TextElement,
    "FbLikeTE"      => FbLikeElement,
    "DiggButtonTE"  => DiggButtonElement,
    "TwitterFeedTE" => TwitterFeedElement,
    "MoustacheTE"   => MoustacheElement,
  }
  
  context "type method" do
    should "return teh correct value" do
      LookupMap.each do |str, klazz|
        assert_equal str, klazz.new._type, "Failed for (1) #{str}"
      end
    end
  end
  
  context "class_for_isa" do
    should "return the correct class" do
      LookupMap.each do |str, klazz|
        assert_equal klazz, PageElement.class_for_isa(str), "Failed for (1) #{str}"
        assert_equal str, klazz._type, "Failed for (2) #{str}"
      end
    end

    should "return strange class name if unknown" do
      assert_equal "UnknownClassFubar", PageElement.class_for_isa("Fubar")
    end
  end
end
