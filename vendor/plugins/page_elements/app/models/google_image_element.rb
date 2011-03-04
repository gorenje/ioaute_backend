class GoogleImageElement < PageElement
  include PageElementHelpers::ImageReloadSupport
  include PageElementHelpers::ImageRotationSupport

  class << self
    def extract_data_from_params(params)
      { :image_url => params["m_imageUrl"],
        :dest_url => params["m_destUrl"] || params["m_urlString"],
      }.merge( obtain_image_reload_from_params(params) ).
        merge( obtain_image_rotation_from_params(params) )
    end
  end

  def _json
    edata = extra_data
    retrieve_image_reload_from_extra_data(edata).
      merge( retrieve_image_rotation_from_extra_data(edata) ).
      merge({ "dest_url" => edata["image_url"] }).
      merge(edata).
      merge({ "unescapedUrl" => edata["image_url"], :id => id_str })
  end

  def self._type
    "GoogleImage"
  end
end
