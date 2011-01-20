class TwitterFeedElement < PageElement

  class << self
    def extract_data_from_params(params)
      { :for_user => params["_forUser"],
      }
    end
  end

  def _json
    extra_data.merge( :id => id_str )
  end
  
  def dump_to_pdf(pdf)
    ## TODO do more here.
  end
  
  def for_user
    extra_data["for_user"]
  end
end
