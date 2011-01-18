module EditorApi
  module PublicationsControllerExtensions
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
    end  
    
    module InstanceMethods
      def ping
        send_off_success(params)
      end
      
      def publish
        ## NOTE: id in this case is the uuid of the publication

        ## TODO: Should check that the current user owns this publication
        publication = Publication.find_by_uuid(params[:id])
        
        if publication.published?
          send_off_success(params, :data => publication.bitlies.first)
        else 
          publication.publish! # should not fail, but you never know.
          if (bitly = publication.generate_bitly(server_url, pub_format(params)))
            send_off_success(params, :data => bitly)
          else
            publication.bitly_failed
            send_off_failed(params, "unable to publish")
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
