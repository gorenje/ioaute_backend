class FacebookElement < PageElement

  class << self
    def extract_data_from_params(params)
      { :pic_url => params["_picUrl"],
        :src_url => params["_srcUrl"],
      }
    end
  end

  def dump_to_pdf(pdf)
    pdf.image open(extra_data["src_url"]), :at =>[x,y], :width => width, :height => height
  end
end