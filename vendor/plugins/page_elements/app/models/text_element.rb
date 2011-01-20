class TextElement < PageElement

  class << self
    def extract_data_from_params(params)
      { :text => params["_textTyped"],
      }
    end
  end

  def _json
    extra_data.merge(:id => id_str)
  end
  
  def dump_to_pdf(pdf)
    ## TODO handle styling, e.g. font + color 
    pdf.bounding_box([x,y], :width => width, :height => height) do
      pdf.font_size 10 do
        pdf.text extra_data["text"]
      end
    end
  end

end
