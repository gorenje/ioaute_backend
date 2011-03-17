class HighlightElement < PageElement
  include PageElementHelpers::ColorSupport
  include PageElementHelpers::CornerSupport
  include PageElementHelpers::ImageRotationSupport

  class << self
    def extract_data_from_params(params)
      obtain_colors_from_params(params).
        merge(obtain_image_rotation_from_params(params)).
        merge(obtain_corner_radius_from_params(params)).
        merge({ :link_url       => params["m_link_url"],
                :clickable      => params["m_is_clickable"],
                :border_width   => params["m_border_width"],
                :show_as_border => params["m_show_as_border"],
              })
    end
  end

  def _json
    edata = extra_data
    retrieve_image_rotation_from_extra_data(edata).
      merge( retrieve_colors_from_extra_data(edata) ).
      merge( retrieve_corner_radius_from_extra_data(edata) ).
      merge( edata ).
      merge( :id => id_str )
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
