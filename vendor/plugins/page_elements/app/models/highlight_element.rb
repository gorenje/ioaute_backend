class HighlightElement < PageElement

  class << self
    def extract_data_from_params(params)
      { :red   => params["m_red"],
        :green => params["m_green"],
        :blue  => params["m_blue"],
        :alpha => params["m_alpha"],
      }
    end
  end

  def _json
    edata = extra_data
    ["red", "blue", "green", "alpha"].
      inject({}) { |t,v| t.merge( v => edata[v] ) }.merge( :id => id_str )
  end

  def css_color_spec
    edata = extra_data
    "rgba(%s,%s,%s,%s)" % ["red", "green", "blue", "alpha"].map { |a| edata[a].to_s }
  end
  
  def self._type
    "HighlightTE"
  end
end
