class HeaderTextElement < TextElement

  class << self
    def extract_data_from_params(params)
      TextElement.extract_data_from_params(params).
        merge( :font_size => params["m_fontSize"] )
    end
  end

  def _json
    super.merge( :font_size => extra_data["font_size"] )
  end
  
  def self._type
    "HeaderTE"
  end
end
