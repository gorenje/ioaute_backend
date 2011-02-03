class GoogleImageElement < PageElement

  class << self
    def extract_data_from_params(params)
      { :image_url => params["m_imageUrl"],
      }
    end
  end

  def _json
    edata = extra_data
    { "unescapedUrl" => edata["image_url"], :id => id_str }
  end

  def self._type
    "GoogleImage"
  end
end
