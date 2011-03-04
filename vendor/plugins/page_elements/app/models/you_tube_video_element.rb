class YouTubeVideoElement < PageElement
  # m_search_engines value:
  # goes all the way back to the Xib for the youtube video property window. It
  # defines tags and these tags are bitwise unique. These tags are dragged all the
  # way from the window to here and their meaning need to match:
  # Amazon     => 1
  # Google     => 2
  # Bing       => 4
  # iTunes     => 8
  # DuckDuckGo => 16
  # **** SPECIAL **** 32 means, if set, don't show the title at the bottom of the video
  # **** SPECIAL **** 64 means, if set, play video immediately on page load.
  include PageElementHelpers::ImageRotationSupport

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
      }.merge( obtain_image_rotation_from_params(params) )
    end
  end
  
  def _json
    edata = extra_data
    edata.merge({ :id => id_str }).merge(retrieve_image_rotation_from_extra_data(edata))
  end

  def video_url(dom_id)
    extra_data["content"]["5"] + "&enablejsapi=1&playerapiid=" + dom_id
  end

  def title
    extra_data["title"]
  end

  def owner
    extra_data["uploader"]
  end

  # Are we going to search either search links or an artist link? Extend this if new
  # search engine is added.
  def show_links?
    edata = extra_data
    bitvalue = edata["m_search_engines"].to_i
    is_a_search_link_set = [1,2,4,8,16].map do |a| 
      (bitvalue & a) > 0 ? 1 : nil 
    end.compact.size > 0
    is_a_search_link_set || (edata["artist"] &&
                             !edata["artist"]["name"].blank? &&
                             !edata["artist"]["url"].blank?)
  end
  
  def dont_show_title?
    (extra_data["m_search_engines"].to_i & 32) > 0
  end

  def play_immediately?
    (extra_data["m_search_engines"].to_i & 64) > 0
  end
  
  def links
    link_dumper = []
    edata = extra_data
    srch_flag = edata["m_search_engines"].to_i
    
    srch_title = CGI.escape(title)
    [ 
     ["@Amazon", 'http://www.amazon.de/s?field-keywords='],
     ["@Google", 'http://google.com/search?q='],
     ["@Bing",   'http://www.bing.com/search?q='],
     ["@iTunes", 'http://google.com/search?q=site:itunes.apple.com+'],
     ["@DDG",    'https://duckduckgo.com/?q=']
    ].each_with_index do |link_info, idx|
      if (srch_flag & (2 ** idx)) > 0
        link_dumper << [link_info[0], link_info[1] + srch_title]
      end
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
