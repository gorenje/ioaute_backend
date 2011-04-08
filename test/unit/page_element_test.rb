require File.expand_path('../../test_helper.rb', __FILE__)

class PageElementTest < ActiveSupport::TestCase

  LookupMap = { 
    "Facebook"       => FacebookElement,
    "Tweet"          => TwitterElement,
    "Flickr"         => FlickrElement,
    "YouTubeVideo"   => YouTubeVideoElement,
    "GoogleImage"    => GoogleImageElement,
    "ImageTE"        => ImageElement,
    "LinkTE"         => LinkElement,
    "TextTE"         => TextElement,
    "FbLikeTE"       => FbLikeElement,
    "DiggButtonTE"   => DiggButtonElement,
    "TwitterFeedTE"  => TwitterFeedElement,
    "HighlightTE"    => HighlightElement,
    "PayPalButtonTE" => PayPalButtonElement,
    "YouTubeCtrlTE"  => YouTubeControlElement,
    "YouTubeSeekToLinkTE" => YouTubeSeekToLinkElement,
  }
  
  # extra lookup only to see if the class matches since these classes
  # have a different _type.
  LookupMapDuplicate = { 
    "TweetTE"   => TwitterElement,
    "YouTubeTE" => YouTubeVideoElement,
  }
  
  context "type method" do
    should "return the correct value" do
      LookupMap.each do |str, klazz|
        assert_equal str, klazz.new._type, "Failed for (1) #{str}"
      end
    end

    should "have default type of PageElement" do
      assert_equal "PageElement", PageElement._type
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

    should "return the correct class" do
      LookupMap.each do |str, klazz|
        assert_equal klazz, PageElement.class_for_isa(str), "Failed for (1) #{str}"
      end
    end
  end
  
  context "css generation" do
    should "should produce the correct css" do
      assert_equal( ("position: absolute; float: none; top: 321.00px; left: 123.00px; "+
                     "width: 1024.00px; height: 2048.00px; z-index: 2;"), 
                    Factory(:page_element).css_style)
    end
  end

  context "json for editor" do
    should "should produce the correct hash object" do
      hsh = Factory(:page_element).to_json_for_editor
      { 
        'height'      => 2048.0,
        'original_id' => nil,
        'width'       => 1024.0,
        'x'           => 123.0,
        'y'           => 321.0,
        'z_index'     => 2,
        '_type'       => "PageElement",
        '_json'       => { 'fubar' =>  'snafu' }
      }.each do |key, value|
        assert_equal value, hsh[key], "Failed for #{key} ==> #{value} != #{hsh[key]}"
      end
    end
  end
end
