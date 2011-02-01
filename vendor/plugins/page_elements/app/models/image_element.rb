class ImageElement < PageElement

  class << self
    def extract_data_from_params(params)
      { :pic_url => params["m_urlString"],
        :dest_url => params["m_destUrl"] || params["m_urlString"],
      }
    end
  end

  def _json
    edata = extra_data
    ## if dest_url has not been sent, use the pic url
    { "dest_url" => edata["pic_url"] }.merge(extra_data).merge( :id => id_str )
  end

  def self._type
    "ImageTE"
  end
  
  def dump_to_pdf(pdf)
    pdf.image open(extra_data["pic_url"]), :at =>[x,y], :width => width, :height => height
  end
end
