class FacebookElement < PageElement

  def dump_to_html
    Haml::Engine.new((<<-EOF).remove_indent).render
    #flickr_image{ :style => '#{css_position}' }
      %img{ :src => '#{extra_data["src_url"]}', :width => 'auto', :height => #{height} }
    EOF
  end

  def dump_to_pdf(pdf)
    pdf.image open(extra_data["src_url"]), :at =>[x,y], :width => width, :height => height
  end

  class << self
    def extract_data_from_params(params)
      { :pic_url => params["_picUrl"],
        :src_url => params["_srcUrl"],
      }
    end
  end
end
