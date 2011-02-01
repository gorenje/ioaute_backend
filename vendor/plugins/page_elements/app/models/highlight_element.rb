class HighlightElement < PageElement
  include PageElementHelpers::ColorSupport

  class << self
    def extract_data_from_params(params)
      obtain_colors_from_params(params)
    end
  end

  def _json
    extra_data.merge(:id => id_str)
  end

  def self._type
    "HighlightTE"
  end
end
