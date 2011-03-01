class ImageElement < PageElement
  include PageElementHelpers::ImageReloadSupport
  
  class << self
    def extract_data_from_params(params)
      { :pic_url         => params["m_urlString"],
        :dest_url        => params["m_destUrl"] || params["m_urlString"],
      }.merge( obtain_image_reload_from_params(params) )
    end
  end

  def _json
    edata = extra_data
    retrieve_image_reload_from_extra_data(edata).
      merge( { "dest_url" => edata["pic_url"] } ).
      merge( edata ).
      merge( :id => id_str )
  end

  def self._type
    "ImageTE"
  end
  
  def dump_to_pdf(pdf)
    pdf.image open(extra_data["pic_url"]), :at =>[x,y], :width => width, :height => height
  end
end
