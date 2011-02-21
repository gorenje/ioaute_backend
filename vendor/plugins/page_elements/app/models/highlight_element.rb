class HighlightElement < PageElement
  include PageElementHelpers::ColorSupport

  class << self
    def extract_data_from_params(params)
      obtain_colors_from_params(params).
        merge({ 
                :link_url       => params["m_link_url"],
                :show_as_border => params["m_show_as_border"],
                :border_width   => params["m_border_width"],
                :clickable      => params["m_is_clickable"],
              })
    end
  end

  def _json
    extra_data.merge(:id => id_str)
  end

  def self._type
    "HighlightTE"
  end
  
  def is_clickable?
    extra_data["clickable"].to_i > 0
  end

  def show_as_border?
    extra_data["show_as_border"].to_i > 0
  end
  
  def link_url
    extra_data["link_url"]
  end
  
  def border_width_pixel
    extra_data["border_width"]
  end
end
