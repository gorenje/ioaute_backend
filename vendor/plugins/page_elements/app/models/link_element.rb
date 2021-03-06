class LinkElement < PageElement
  include PageElementHelpers::ColorSupport
  include PageElementHelpers::FontSupport

  class << self
    def extract_data_from_params(params)
      { :url   => params["m_urlString"],
        :title => params["m_linkTitle"],
      }.merge( obtain_colors_from_params(params) ).
        merge( obtain_font_info_from_params(params) )
    end
  end

  def _json
    extra_data.merge(:id => id_str)
  end
  
  def self._type
    "LinkTE"
  end

  def dump_to_pdf(pdf)
    ## TODO do more here.
  end
  
  def url
    # don't prefix anything, this allows for '#page02' links so that an index link
    # can be created.
    extra_data["url"]
  end

  def title
    extra_data["title"]
  end
  
  def index_link?
    url[0] == '#'
  end
  
  def link_target
    index_link? ? '' : '_blank'
  end
end
