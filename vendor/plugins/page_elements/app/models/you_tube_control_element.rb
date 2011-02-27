class YouTubeControlElement < PageElement
  class << self
    def extract_data_from_params(params)
      { }
    end
  end
  
  def _json
    { :id => id_str }
  end

  def self._type
    "YouTubeCtrlTE"
  end
end
