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
  
  def update_references(new_publication)
    video_id = extra_data["video_id"].to_i
    return if video_id.to_i <= 0
    
    new_publication.pages.each do |page|
      page.page_elements.each do |page_element|
        if page_element.original_id == video_id
          update_attribute(:data, extra_data.merge("video_id" => page_element.id).to_json)
          return
        end
      end
    end
  end
  
  def start_at
    extra_data["start_at_secs"] || "0"
  end
  def end_at
    extra_data["end_at_secs"] || "0"
  end
end
