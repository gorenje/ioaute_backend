class FlickrElement < PageElement

  def dump_to_html
    Haml::Engine.new((<<-EOF).remove_indent).render
    #flickr_image{ :style => '#{css_position}' }
      %img{ :src => '#{construct_flickr_image_url}', :width => 'auto', :height => #{height} }
    EOF
  end
  
  ## TODO add name and link and etc....
  def dump_to_pdf(pdf)
    pdf.image open(construct_flickr_image_url), :at =>[x,y], :width => width, :height => height
  end
  
  class << self
    def extract_data_from_params(params)
      { :secret => params["_secret"],
        :farm   => params["_farm"],
        :server => params["_server"], 
      }
    end
  end
  
  protected
  
  def construct_flickr_image_url
    flickr_data = extra_data.merge("size" => "b", "id" => id_str)
    ("http://farm" + flickr_data["farm"] + ".static.flickr.com/" + flickr_data["server"] + 
     "/" + flickr_data["id"] + "_" + flickr_data["secret"] + "_" + flickr_data["size"]+".jpg")
  end
end
