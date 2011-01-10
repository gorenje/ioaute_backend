class Bitly < ActiveRecord::Base
  
  ApiToken = ApiKeys.Bitly.api_token
  Username = ApiKeys.Bitly.username
  BaseUrl  = ApiKeys.Bitly.base_url
  
  belongs_to :publication
  
  class << self
    def validate_apikey
      d = JSON.parse(RestClient.post(url_for("validate"), 
                                     :login => Username, :apiKey => ApiToken,
                                     :x_login => Username, :x_apiKey => ApiToken))
      d["data"]["valid"] == 1
    end
    
    def for_publication(publication, server_url, format)
      # HTML is the default, therefore don't include extension if using html.
      url = "%s/%s%s" % [server_url, publication.uuid, format == "html" ? "" : ".#{format}"]
      shorten(url, :publication_id => publication.id, :format => format)
    end
    
    def shorten(long_url, params = {})
      d = JSON.parse(RestClient.post(url_for("shorten"), :login => Username, 
                                     :apiKey => ApiToken,  :longUrl => long_url, 
                                     :format => :json))
      if (d["status_code"] == 200)
        d = d["data"]
        Bitly.create(:long_url       => d["long_url"],
                     :short_url      => d["url"],
                     :global_hash    => d["global_hash"],
                     :publication_id => params[:publication_id],
                     :format         => params[:format] || "unknown",
                     :hash           => d["hash"])
      else 
        raise Exception.new(d["status_txt"])
      end
    end
    
    def url_for(action)
      "%s%s" % [ BaseUrl, action ]
    end
  end
end
