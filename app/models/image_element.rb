class ImageElement < PageElement

  def dump_to_pdf(pdf)
    pdf.image open(extra_data["pic_url"]), :at =>[x,y], :width => width, :height => height
  end
  
  class << self
    def extract_data_from_params(params)
      { :pic_url => params["_urlString"],
      }
    end
  end
end
