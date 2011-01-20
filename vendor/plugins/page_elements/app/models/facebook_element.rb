class FacebookElement < PageElement

  class << self
    def extract_data_from_params(params)
      { :pic_url => params["_picUrl"],
        :src_url => params["_srcUrl"],
        :owner   => params["_fromUser"],
      }
    end
  end

  def _json
    edata = extra_data
    { :picture => edata["pic_url"], 
      :source  => edata["src_url"],
      :id      => id_str,
      :from    => { :name => edata["owner"] },
    }
  end
    
  def dump_to_pdf(pdf)
    pdf.image open(extra_data["src_url"]), :at =>[x,y], :width => width, :height => height
  end
end
