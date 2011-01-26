module EditorApi
  module PublicationsControllerExtensions
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
    end  
    
    module InstanceMethods
      def ping
        # BTW always have an even number of tools, this makes the tool box look better
        toolboxitems = [
          { "id" => "1", "name" => "Text",         "klazz" => "TextTE" },
          { "id" => "8", "name" => "Small", "klazz" => "HeaderTE", 
            "font_size" => 16 },
          { "id" => "9", "name" => "Medium","klazz" => "HeaderTE", 
            "font_size" => 20 },
          { "id" => "10", "name" => "Large","klazz" => "HeaderTE", 
            "font_size" => 24 },
          { "id" => "3", "name" => "Image",        "klazz" => "ImageTE" },
          { "id" => "5", "name" => "FB Like",      "klazz" => "FbLikeTE" },
          { "id" => "6", "name" => "Twitter Feed", "klazz" => "TwitterFeedTE" },
          { "id" => "7", "name" => "Digg",         "klazz" => "DiggButtonTE" },
          { "id" => "4", "name" => "Link",         "klazz" => "LinkTE" },
          { "id" => "2", "name" => "Moustache",    "klazz" => "MoustacheTE" },
          { "id" => "11", "name" => "Coming Soon", "klazz" => "ToolElement" },
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
      
      def pub_format(params)
        case ( params[:pub_format] )
        when /html/i then "html"
        else "pdf"
        end
      end
    end
  end
end
