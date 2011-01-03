class TextElement < PageElement

  def dump_to_html
    Haml::Engine.new((<<-EOF).remove_indent).render
    #text_element{ :style => '#{css_position}' }
      = \"#{extra_data["text"].split.join('&nbsp;<br>')}\"
    EOF
  end

  def dump_to_pdf(pdf)
    ## TODO handle styling, e.g. font + color 
    pdf.bounding_box([x,y], :width => width, :height => height) do
      pdf.font_size 10 do
        pdf.text extra_data["text"]
      end
    end
  end

  class << self
    def extract_data_from_params(params)
      { :text => params["_textTyped"],
      }
    end
  end
end
