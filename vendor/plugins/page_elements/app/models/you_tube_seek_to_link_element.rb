class YouTubeSeekToLinkElement < PageElement
  include PageElementHelpers::ColorSupport
  include PageElementHelpers::FontSupport

  class << self
    def extract_data_from_params(params)
      { :text          => params["m_textTyped"],
        :start_at_secs => params["m_start_at_secs"],
        :end_at_secs   => params["m_end_at_secs"],
        :video_id      => params["m_video_id"],
      }.merge( obtain_colors_from_params(params) ).
        merge( obtain_font_info_from_params(params) )
    end
  end

  def _json
    extra_data.merge(:id => id_str)
  end
  
  def self._type
    "YouTubeSeekToLinkTE"
  end

  def dump_to_pdf(pdf)
    ## TODO do more here.
  end
  
  def text
    extra_data["text"]
  end
  
  def video
    PageElement.find(extra_data["video_id"])
  end
  
  def start_at
    extra_data["start_at_secs"] || "0"
  end
  def end_at
    extra_data["end_at_secs"] || "0"
  end
end
