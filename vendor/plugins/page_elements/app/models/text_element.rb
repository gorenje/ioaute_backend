class TextElement < PageElement
  include PageElementHelpers::ColorSupport
  include PageElementHelpers::FontSupport

  class << self
    def extract_data_from_params(params)
      obtain_colors_from_params(params).
        merge( obtain_font_info_from_params(params) ).
        merge( :text => params["_textTyped"] )
    end
  end

  def _json
    edata = extra_data
    edata.merge({ :text => (edata["text"] || "Type Text Here"), :id => id_str })
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
