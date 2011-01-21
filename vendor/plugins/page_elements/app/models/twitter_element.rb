class TwitterElement < PageElement

  class << self
    def extract_data_from_params(params)
      { :from_user => params["_fromUser"],
        :text      => params["_text"],
      }
    end
  end

  def _json
    edata = extra_data
    ## don't merge extra_data and send it back, in this case the data is used as cache
    ## see below.
    { :from_user => edata["from_user"], :text => edata["text"], :id_str => id_str }
  end
  
  def self._type
    "Tweet"
  end

  ## TODO do more here.
  def dump_to_pdf(pdf)
    twhsh = tweet
    pdf.bounding_box([x,y], :width => width, :height => height) do
      pdf.font_size 10 do
        pdf.text twhsh["text"]
        pdf.text "By: %s" % (twhsh["user"]["name"] || twhsh["user"]["screen_name"])
        pdf.text "Retweets: %d" % twhsh["retweet_count"]
      end
    end
  end
  
  def twitter_url
    "http://twitter.com/%s/status/%s" % [extra_data["from_user"],id_str]
  end

  def tweet
    extra_data["tweet"] || cache_tweet
  end
  
  protected
  
  def cache_tweet
    tweet = JSON.parse(RestClient.get(ApiKeys.twitter.base_show_url % id_str))
    store_extra_data(extra_data.merge(:tweet => tweet))
    tweet
  rescue Exception => e
    nil
  end
end
