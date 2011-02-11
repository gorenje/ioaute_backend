class FlickrElement < PageElement

  class << self
    def extract_data_from_params(params)
      { :secret   => params["_secret"],
        :farm     => params["_farm"],
        :server   => params["_server"],
        :title    => params["_title"],
        :dest_url => params["m_destUrl"],
      }
    end
  end
  
  def _json
    extra_data.merge( :id => id_str )
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
