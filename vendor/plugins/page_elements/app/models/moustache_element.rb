class MoustacheElement < PageElement
  CopyrightUrl = "http://www.flickr.com/photos/marcjohns/2553260141/"
  ImageUrl = "http://assets.2monki.es/images/moustache.png"
  
  def _json
    { :id => id_str }
  end
end
