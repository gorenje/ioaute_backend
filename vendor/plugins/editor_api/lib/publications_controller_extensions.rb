module EditorApi
  module PublicationsControllerExtensions
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
    end  
    
    module InstanceMethods
      def ping
        # BTW always have an even number of tools, this makes the tool box look better
        toolboxitems = [

          { "id" => "3",  "name" => "Image",        "klazz" => "ImageTE" },
          { "id" => "4",  "name" => "Link",         "klazz" => "LinkTE" },
          { "id" => "6",  "name" => "Twitter Feed", "klazz" => "TwitterFeedTE" },
          { "id" => "18", "name" => "YouTube Video","klazz" => "YouTubeTE" },
          { "id" => "5",  "name" => "Like it!",     "klazz" => "FbLikeTE" },
          { "id" => "7",  "name" => "Digg it!",     "klazz" => "DiggButtonTE" },

          { "id" => "2",  "name" => "Groucho it!",  "klazz" => "ImageTE",
            "dest_url" => "http://www.flickr.com/photos/marcjohns/2553260141/",
            "pic_url" => "http://assets.2monki.es/images/moustache.png",
            "tool_image" => "toolMoustache", "width" => 150, "height" => 50 },
                        
          { "id" => "17", "name" => "PayPal",       "klazz" => "PayPalButtonTE" },
 
          basic_text_element,
          basic_text_element.merge("font_size" => 16, "id" => 8, "name" => "Larger"),
          basic_text_element.merge("font_size" => 20, "id" => 9, "name" => "Still Larger"),
          basic_text_element.merge("font_size" => 24, "id" => 10, "name" => "Largest"),
                        
          { "id" => "11", "name" => "Highlight - Green", "klazz" => "HighlightTE",
            "red" => "131", "blue" => "52", "green" => "255", "alpha" => "0.4"},

          { "id" => "19", "name" => "Highlight - Red", "klazz" => "HighlightTE",
            "red" => "255", "blue" => "52", "green" => "55", "alpha" => "0.4"},

          { "id" => "15", "name" => "Horiz Bar", "klazz" => "HighlightTE",
            "red" => "0", "blue" => "0", "green" => "0", "alpha" => "1.0",
            "width" => 200, "height" => 5, "image" => "toolHorizBar" },

          { "id" => "16", "name" => "Vert. Bar", "klazz" => "HighlightTE",
            "red" => "0", "blue" => "0", "green" => "0", "alpha" => "1.0",
            "width" => 5, "height" => 200, "image" => "toolVerticalBar" },
                        
          { "id" => "12", "name" => "Bubble", "klazz" => "ImageTE",
            "dest_url" => "http://duncanpierce.org/files/images/speech-question-marks.png",
            "pic_url" => "http://assets.2monki.es/images/speech-bubble.png",
            "tool_image" => "toolSpeechBubble", "width" => 125, "height" => 125 },
                        
          { "id" => "13", "name" => "Coming Soon", "klazz" => "ToolElement" },
          { "id" => "20", "name" => "Coming Soon", "klazz" => "ToolElement" },
          { "id" => "14", "name" => "Coming Soon", "klazz" => "ToolElement" },
         ]

        ## Possible Button Values (to be found in AppController.j):
        ## DiggToolbarItemIdentifier
        ## StumbleuponToolbarItemIdentifier
        ## BitlyUrlToolbarItemIdentifier
        ##
        ## PublishPublicationToolbarItemIdentifier
        ## PublishPublicationHtmlToolbarItemIdentifier
        
        # If the user isn't a facebook user, then don't show the facebook window
        middle_buttons = [
                          "FlickrWindowControlItemIdentifier",
                          "TwitterWindowControlItemIdentifier",
                          current_user.facebook_connected? ? "FacebookToolbarItemIdentifier" : nil,
                          "YouTubeToolbarItemIdentifier",
                          "GoogleImagesWindowControlItemIdentifier",
                          ].compact
        
        send_off_success(params, :data => { 
          :facebook_app_id => ApiKeys.facebook.api_id,
          :flickr_api_key  => ApiKeys.flickr.api_token,
          :tool_box_items  => toolboxitems.reverse, # ordering is reversed on display
          :toolbar_left   => ["BackToPublicationsControlItemIdentifier"],
          :toolbar_middle => middle_buttons,
          :toolbar_right  => ["PreviewPublicationHtmlToolbarItemIdentifier",
                              "PublishPublicationHtmlToolbarItemIdentifier"],
        })
      end
      
      def publish
        ## NOTE: id in this case is the uuid of the publication
        publication = Publication.for_user(current_user).find_by_uuid!(params[:id])
        
        if publication.published?
          send_off_success(params, :data => publication.bitlies.first)
        else 
          publication.publish! # should not fail, but you never know.
          if (bitly = publication.generate_bitly(server_url, pub_format(params)))
            send_off_success(params, :data => bitly)
          else
            publication.bitly_failed!
            send_off_failed(params, "unable to publish at this time")
          end
        end
      rescue Exception => e 
        send_off_failed(params, e.to_s)
      end
      
      protected 
      
      def basic_text_element
        { "id" => "1", "name" => "Text",  "klazz" => "TextTE" ,
          "red" => "0", "blue" => "0", "green" => "0", "alpha" => "1.0",
          "font_size" => 12, "font_name" => "Arial Black" }
      end
      
      def pub_format(params)
        case ( params[:pub_format] )
        when /html/i then "html"
        else "pdf"
        end
      end
    end
  end
end
