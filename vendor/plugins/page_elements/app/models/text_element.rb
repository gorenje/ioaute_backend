class TextElement < PageElement

  class << self
    def extract_data_from_params(params)
      { :text => params["_textTyped"],
      }
    end
  end

  def _json
    edata = extra_data
    { :text => (edata["text"] || "Type Text Here"), :id => id_str }
  end
  
  def self._type
    "TextTE"
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
