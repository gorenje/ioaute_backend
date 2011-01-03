class ImageElement < PageElement

  def dump_to_html
    Haml::Engine.new((<<-EOF).remove_indent).render
    #image_element_image{ :style => '#{css_position}' }
      %img{ :src => '#{extra_data["pic_url"]}', :width => 'auto', :height => #{height} }
    EOF
  end

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
