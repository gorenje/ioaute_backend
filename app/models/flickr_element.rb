class FlickrElement < PageElement

  def dump_to_pdf(pdf)
    pdf.image open(construct_flickr_image_url), :at =>[x,y], :width => width, :height => height
  end
  
  protected
  
  def construct_flickr_image_url
    flickr_data = extra_data
    ("http://farm" + flickr_data["farm"] + ".static.flickr.com/" + flickr_data["server"] + 
      "/" + id_str + "_" + flickr_data["secret"] + "_b.jpg")

  end
end
