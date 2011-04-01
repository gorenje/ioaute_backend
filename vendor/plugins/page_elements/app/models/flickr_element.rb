class FlickrElement < PageElement
  include PageElementHelpers::ImageReloadSupport
  include PageElementHelpers::ImageRotationSupport
  include PageElementHelpers::ImageFlagsSupport

  class << self
    def extract_data_from_params(params)
      { :secret   => params["_secret"],
        :farm     => params["_farm"],
        :server   => params["_server"],
        :title    => params["_title"],
        :dest_url => params["m_destUrl"],
      }.merge( obtain_image_reload_from_params(params) ).
        merge( obtain_image_rotation_from_params(params) ).
        merge( obtain_image_flags_from_params(params) )
    end
  end
  
  def _json
    edata = extra_data
    edata.merge( :id => id_str ).
      merge( retrieve_image_reload_from_extra_data(edata) ).
      merge( retrieve_image_rotation_from_extra_data(edata) ).
      merge( retrieve_image_flags_from_extra_data(edata) )
  end

  def self._type
    "Flickr"
  end
  
  ## TODO add name and link and etc....
  def dump_to_pdf(pdf)
    pdf.image open(construct_flickr_image_url), :at =>[x,y], :width => width, :height => height
  end
  
  def construct_flickr_image_url
    flickr_data = extra_data.merge("size" => "b", "id" => id_str)
    ("http://farm" + flickr_data["farm"] + ".static.flickr.com/" + flickr_data["server"] + 
     "/" + flickr_data["id"] + "_" + flickr_data["secret"] + "_" + flickr_data["size"]+".jpg")
  end
  
  def construct_owner_url
    "http://flickr.com/photo.gne?id=#{id_str}"
  end
  
  def flickr_title
    extra_data["title"]
  end
end
