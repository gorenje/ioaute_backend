module EditorApi
  module PublicationsControllerExtensions
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
    end  
    
    module InstanceMethods
      def ping
        publication = Publication.for_user(current_user).find_by_uuid!(params[:id])
        
        # BTW always have an even number of tools, this makes the tool box look better
        toolboxitems = [

          { "id" => "3",  "name" => "Image", "klazz" => "ImageTE", 
            "tool_tip" => "Add an image to the document by dragging this into the document. Images are added by using their external URL." },

          { "id" => "4",  "name" => "Link",         "klazz" => "LinkTE",
            "font_size" => 12, "font_name" => "Arial Black",
            "red" => "0", "blue" => "255", "green" => "0", "alpha" => "1.0",
            "tool_tip" => "Add an external link by dragging this into your document."},

          { "id" => "6",  "name" => "Twitter Feed", "klazz" => "TwitterFeedTE",
            "tool_tip" => "Will add a Twitter feed box for a specific topic or user." },

          { "id" => "13", "name" => "Tweet", "klazz" => "TweetTE",
            "tool_tip" => ("Add a single specific Tweet to the document. "+
                            "You will need to know the URL of the tweet.") },

          { "id" => "20", "name" => "YouTube Controls", "klazz" => "YouTubeCtrlTE",
            "tool_tip" => ("Add simple controls for automatically playing several "+
                           "YouTube videos. This is good for a playlist created from "+
                           "YouTube videos.") },

          { "id" => "18", "name" => "YouTube Video",    "klazz" => "YouTubeTE",
            "tool_tip" => ("Add a YouTube video directly via it's address. Copy the address from the YouTube page and paste it here.") },

          { "id" => "14", "name" => "YouTube SeekTo",   "klazz" => "YouTubeSeekToLinkTE",
            "font_size" => 12, "font_name" => "Courier",
            "red" => "0", "blue" => "255", "green" => "0", "alpha" => "1.0",
            "tool_tip" => ("Allow you to seek to a specific position of a YouTube video contained in your document.")},

          { "id" => "5",  "name" => "Like it!",     "klazz" => "FbLikeTE",
            "tool_tip" => ("Add a Facebook like-it button.") },


          basic_text_element,
          basic_text_element.merge("font_size" => 16, "id" => 8, "name" => "Larger"),
          basic_text_element.merge("font_size" => 20, "id" => 9, "name" => "Still Larger"),
          basic_text_element.merge("font_size" => 24, "id" => 10, "name" => "Largest"),
                        
          { "id" => "11", "name" => "Highlight - Green", "klazz" => "HighlightTE",
            "red" => "131", "blue" => "52", "green" => "255", "alpha" => "0.4",
            "tool_tip" => ("Green highlight. Use the properties window to modify the color.")},

          { "id" => "19", "name" => "Highlight - Red", "klazz" => "HighlightTE",
            "red" => "255", "blue" => "52", "green" => "55", "alpha" => "0.4",
            "tool_tip" => ("Red highlight. Use the properties window to modify the color.")},

          { "id" => "15", "name" => "Horiz Bar", "klazz" => "HighlightTE",
            "red" => "0", "blue" => "0", "green" => "0", "alpha" => "1.0",
            "width" => 200, "height" => 5, "image" => "toolHorizBar",
            "tool_tip" => ("Use horizontal bar to divide up your document.") },

          { "id" => "16", "name" => "Vert. Bar", "klazz" => "HighlightTE",
            "red" => "0", "blue" => "0", "green" => "0", "alpha" => "1.0",
            "width" => 5, "height" => 200, "image" => "toolVerticalBar",
            "tool_tip" => ("Vertical bar to divide sections of your document.") },
                        
          { "id" => "2",  "name" => "Groucho it!",  "klazz" => "ImageTE",
            "dest_url" => "http://www.flickr.com/photos/marcjohns/2553260141/",
            "pic_url" => "http://assets.2monki.es/images/moustache.png",
            "tool_image" => "toolMoustache", "width" => 150, "height" => 50,
            "tool_tip" => ("Need a disguise? Then why not use a moustache! No one will recognise you.") },
                        
          { "id" => "12", "name" => "Bubble", "klazz" => "ImageTE",
            "dest_url" => "http://duncanpierce.org/files/images/speech-question-marks.png",
            "pic_url" => "http://assets.2monki.es/images/speech-bubble.png",
            "tool_image" => "toolSpeechBubble", "width" => 125, "height" => 125,
            "tool_tip" => ("What to say something? Then add a speech-bubble to your document.") },
                        
          { "id" => "7",  "name" => "Digg it!",     "klazz" => "DiggButtonTE",
            "tool_tip" => ("Add a DiggIt button to your document.") },

          { "id" => "17", "name" => "PayPal",       "klazz" => "PayPalButtonTE",
            "tool_tip" => "Add a PayPal donation button. Three different sizes are available."},

          { "id" => "21", "name" => "Border", "klazz" => "HighlightTE",
            "red" => "0", "blue" => "0", "green" => "0", "alpha" => "1.0",
            "width" => "150", "height" => "200", "image" => "toolBorder",
            "border_width" => "10", "corner_top_left" => "5","corner_top_right" => "5",
            "corner_bottom_right" => "5","corner_bottom_left" => "5",
            "show_as_border"=>"1", "tool_tip" => ("Add a border around another element.")},

          { "id" => "22", "name" => "Box", "klazz" => "HighlightTE",
            "red" => "0", "blue" => "0", "green" => "0", "alpha" => "1.0",
            "width" => "150", "height" => "200", "image" => "toolBox",
            "border_width" => "10", "corner_top_left" => "5", "corner_top_right" => "5",
            "corner_bottom_right" => "5","corner_bottom_left" => "5",
            "show_as_border"=>"0", "tool_tip" => ("Add a box to the document.")},
                        
          { "id" => "23", "name" => "Banksy Love", "klazz" => "ImageTE",
            "dest_url" => 
              "http://secondst.files.wordpress.com/2011/02/banksy-love-rat-386-p.jpg",
            "pic_url" => "http://assets.2monki.es/images/banksy-love-rat.png",
            "tool_image" => "toolBanksysLoveRat", "width" => 125, "height" => 125,
            "tool_tip" => ("Banksy loves us all.") },

          { "id" => "24", "name" => "Banksy Rat", "klazz" => "ImageTE",
            "dest_url" => "http://www.banksycanvas.co.uk/",
            "pic_url" => "http://assets.2monki.es/images/banksy-pap-rat.png",
            "tool_image" => "toolBanksysPapRat", "width" => 125, "height" => 125,
            "tool_tip" => ("Banksy came, saw and conquered.") },
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
                          (current_user.facebook_connected? ? 
                           "FacebookToolbarItemIdentifier" : nil),
                          "YouTubeToolbarItemIdentifier",
                          "GoogleImagesWindowControlItemIdentifier",
                          ].compact
        
        send_off_success(params, :data => { 
          :facebook_app_id => ApiKeys.facebook.api_id,
          :flickr_api_key  => ApiKeys.flickr.api_token,
          :tool_box_items  => toolboxitems.reverse, # ordering is reversed on display
          :toolbar_left   => ["BackToPublicationsControlItemIdentifier",
                              "CopyPageElementControlItemIdentifier",
                              "PastePageElementControlItemIdentifier",
                              "PublicationPropertyControlItemIdentifier"],
          :toolbar_middle => middle_buttons,
          :toolbar_right  => ["PreviewPublicationHtmlToolbarItemIdentifier",
                              "PublishPublicationHtmlToolbarItemIdentifier"],
          :publication => publication.generate_json_data,
          :tool_tips   => all_tool_tips
        })
      rescue Exception => e 
        send_off_failed(params, e.to_s)
      end

      def all_tool_tips
        { "CopyPageElementControlItemIdentifier" => 
          "Copy the current element. Can be used to copy elements across pages.",
          "GoogleImagesWindowControlItemIdentifier" => 
          "Search Google Images for images.",
          "YouTubeToolbarItemIdentifier" => 
          "Find a YouTube video to include in your publication",
          
          "FacebookToolbarItemIdentifier" => 
          "Get public images from your Facebook account and from those of your friends.",
          "TwitterWindowControlItemIdentifier" => 
          "Find Tweets to include in your publication",
          "FlickrWindowControlItemIdentifier" => 
          "Find images on Flickr. Use '@' to access fotos of a specific user.",
          "PreviewPublicationHtmlToolbarItemIdentifier" => 
          "Preview this publication in a new tab.",
          "PublishPublicationHtmlToolbarItemIdentifier" => 
          "Generate a shortened URL for this document. The document address can then be tweeted.",
          "BackToPublicationsControlItemIdentifier" => "Go back to your publication list.",
          "PastePageElementControlItemIdentifier" => "Paste a copied element into the document.",
          "PublicationPropertyControlItemIdentifier" => "Modify the properties of the entire publication including deactivating tool-tips ...."
        }
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
      
      def update
        publication = Publication.for_user(current_user).find_by_uuid!(params[:id])
        publication.
          update_attributes({ :name => params["m_name"] || publication.name,
                              :data => Publication.
                              obtain_colors_from_params(params).
                              merge({ "snap_grid_width" => params["m_snap_grid_width"],
                                      "continous"       => params["m_continous"],
                                      "shadow"          => params["m_has_shadow"]}).to_json})
        send_off_success(params, :data => publication.generate_json_data)
      rescue Exception => e 
        send_off_failed(params, e.to_s)
      end
      
      protected 
      
      def basic_text_element
        { "id" => "1", "name" => "Text",  "klazz" => "TextTE" ,
          "red" => "0", "blue" => "0", "green" => "0", "alpha" => "1.0",
          "font_size" => 12, "font_name" => "Arial Black",
          "tool_tip" => "Add some text to the document." }
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
