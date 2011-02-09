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
        :artist => { 
          :url => params["m_artist_url"],
          :name => params["m_artist_name"],
        },
        :title            => params["m_title"],
        :uploader         => params["m_owner"],
        :m_search_engines => params["m_search_engines"],
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

  def show_links?
    edata = extra_data
    ((edata["m_search_engines"].to_i || 0) > 0) || (edata["artist"] && 
                                                    !edata["artist"]["url"].blank?)
  end
  
  def links
    link_dumper = []
    edata = extra_data
    srch_flag = edata["m_search_engines"].to_i
    
    # this goes all the back to the Xib for the youtube video property window .. it
    # defines tags and these tags are bitwise unique. These tags are dragged all the
    # way from the window to here and they need to match.
    # Amazon    => 1
    # Google    => 2
    # Bing      => 4
    # SevenLoad => 8
    # DuckDuckGo => 16
    srch_title = CGI.escape(title)
    [ 
     ["@Amazon", "http://www.amazon.de/s?field-keywords=#{srch_title}"],
     ["@Google", "http://google.com/search?q=#{srch_title}"],
     ["@Bing", ""],
     ["@SevenLoad", ""],
     ["@DuckDuckGo", ""]
    ].each_with_index do |link_info, idx|
      link_dumper << link_info if (srch_flag & (2 ** idx)) > 0
    end

    if edata["artist"] && !edata["artist"]["url"].blank?
      artist_name = edata["artist"]["name"].blank? ? "@Artist" :edata["artist"]["name"]
      link_dumper << [artist_name, edata["artist"]["url"]]
    end
    link_dumper
  end
  
  def self._type
    "YouTubeVideo"
  end
end
