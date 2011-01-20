class DiggButtonElement < PageElement

  def _json
    { :id => id_str }
  end
  
  def dump_to_pdf(pdf)
    ## TODO how to dump a facebook like button to a pdf?
  end
end
