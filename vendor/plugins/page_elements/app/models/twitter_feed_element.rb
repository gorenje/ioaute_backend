class TwitterFeedElement < PageElement

  class << self
    def extract_data_from_params(params)
      { :term_string => params["m_term_string"],
      }
    end
  end

  def _json
    edata = extra_data
    { :id => id_str, :term_string => edata["for_user"] || edata["term_string"] }
  end
  
  def self._type
    "TwitterFeedTE"
  end

  def search_term
    sterm = extra_data["for_user"] || extra_data["term_string"]
    return "#internet" if sterm.nil? or sterm.blank?
    return "to:#{sterm[1..-1]}" if sterm[0] == '@'
    return sterm if sterm[0] == '#'
    "from:#{sterm}"
  end
  
  def title
    sterm = extra_data["for_user"] || extra_data["term_string"]
    return "Search for #internet" if sterm.nil? or sterm.blank?
    return "All tweets to #{sterm}" if sterm[0] == '@'
    return "Search for #{sterm}" if sterm[0] == '#'
    "All Tweets from #{sterm}"
  end
end
