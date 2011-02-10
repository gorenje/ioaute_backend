class GoogleImageElement < PageElement

  class << self
    def extract_data_from_params(params)
      { :image_url => params["m_imageUrl"],
        :dest_url => params["m_destUrl"] || params["m_urlString"],
      }
    end
  end

  def _json
    edata = extra_data
    { "dest_url" => edata["image_url"] }.merge(edata).
      merge({ "unescapedUrl" => edata["image_url"], :id => id_str })
  end

  def self._type
    "GoogleImage"
  end
end
