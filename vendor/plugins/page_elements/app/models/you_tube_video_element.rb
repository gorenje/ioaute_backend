class YouTubeVideoElement < PageElement
  class << self
    def extract_data_from_params(params)
      { :thumbnail => { 
          "sqDefault" => params["m_thumbnailUrl"],
          "hqDefault" => params["m_imageUrl"],
        },
        :content => { 
          "5" => params["m_video"]
        },
        :title => params["m_title"],
        :uploader => params["m_owner"],
      }
    end
  end
  
  def _json
    extra_data.merge({ :id => id_str })
  end

  def video_url
    extra_data["content"]["5"]
  end

  def title
    extra_data["title"]
  end

  def owner
    extra_data["uploader"]
  end

  def show_search_links?
    true
  end
  
  def links
    srch_title = CGI.escape(title)
    [ 
     ["@Amazon", "http://www.amazon.de/s?field-keywords=#{srch_title}"],
     ["@Google", "http://google.com/search?q=#{srch_title}"] 
    ]
  end
  
  def self._type
    "YouTubeVideo"
  end
end
