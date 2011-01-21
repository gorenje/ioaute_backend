class FbLikeElement < PageElement

  def _json
    { :id => id_str }
  end

  def self._type
    "FbLikeTE"
  end
  
  def dump_to_pdf(pdf)
    ## TODO how to dump a facebook like button to a pdf?
  end
end
