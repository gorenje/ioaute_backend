module EditorApi
  module PublicationsControllerExtensions
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
    end  
    
    module InstanceMethods
      def ping
        # BTW always have an even number of tools, this makes the tool box look better
        toolboxitems = [
          basic_text_element,
          basic_text_element.merge("font_size" => 16, "id" => 8, "name" => "Larger"),
          basic_text_element.merge("font_size" => 20, "id" => 9, "name" => "Still Larger"),
          basic_text_element.merge("font_size" => 24, "id" => 10, "name" => "Largest"),

          { "id" => "3", "name" => "Image",        "klazz" => "ImageTE" },
          { "id" => "5", "name" => "FB Like",      "klazz" => "FbLikeTE" },
          { "id" => "6", "name" => "Twitter Feed", "klazz" => "TwitterFeedTE" },
          { "id" => "7", "name" => "Digg",         "klazz" => "DiggButtonTE" },
          { "id" => "4", "name" => "Link",         "klazz" => "LinkTE" },
          { "id" => "2", "name" => "Moustache",    "klazz" => "MoustacheTE" },

          { "id" => "11", "name" => "Highlight", "klazz" => "HighlightTE",
            "red" => "131", "blue" => "52", "green" => "255", "alpha" => "0.4"},

          { "id" => "15", "name" => "Horiz Bar", "klazz" => "HighlightTE",
            "red" => "0", "blue" => "0", "green" => "0", "alpha" => "1.0",
            "width" => 200, "height" => 5, "image" => "toolHorizBar" },
          { "id" => "16", "name" => "Vert. Bar", "klazz" => "HighlightTE",
            "red" => "0", "blue" => "0", "green" => "0", "alpha" => "1.0",
            "width" => 5, "height" => 200, "image" => "toolVerticalBar" },
                        
          { "id" => "12", "name" => "Coming Soon", "klazz" => "ToolElement" },
          { "id" => "13", "name" => "Coming Soon", "klazz" => "ToolElement" },
          { "id" => "14", "name" => "Coming Soon", "klazz" => "ToolElement" },
         ]

        send_off_success(params, :data => { 
          :facebook_app_id => ApiKeys.facebook.api_id,
          :tool_box_items  => toolboxitems.reverse, # ordering is reversed on display
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
