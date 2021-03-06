class PageElement < ActiveRecord::Base
  belongs_to :page
  belongs_to :original, :class_name => "PageElement"
  
  @@lokuptable = nil
  
  ## TODO not really used yet, could disappear.
  state_machine :state, :initial => :created do
    [:created, :editing, :published, :locked, :hidden, :deleted].each { |stat| state stat }
  end

  class << self
    # Select the corresponding class for the element used in the editor. Don't take 'isa' 
    # on face value, check whether we have a corresponding mapping for the isa value.
    def class_for_isa(isa_str)
      (@@lokuptable || (@@lokuptable={
        "Facebook"       => FacebookElement,
        "Tweet"          => TwitterElement,
        "TweetTE"        => TwitterElement,
        "Flickr"         => FlickrElement,
        "YouTubeVideo"   => YouTubeVideoElement,
        "YouTubeTE"      => YouTubeVideoElement,
        "GoogleImage"    => GoogleImageElement,
        "ImageTE"        => ImageElement,
        "LinkTE"         => LinkElement,
        "TextTE"         => TextElement,
        "FbLikeTE"       => FbLikeElement,
        "DiggButtonTE"   => DiggButtonElement,
        "TwitterFeedTE"  => TwitterFeedElement,
        "HighlightTE"    => HighlightElement,
        "PayPalButtonTE" => PayPalButtonElement,
        "YouTubeCtrlTE"  => YouTubeControlElement,
        "YouTubeSeekToLinkTE" => YouTubeSeekToLinkElement,
      }))[isa_str] || "UnknownClass#{isa_str}"
    end

    ## This is called when we are about to create a new page elements. Each page element
    ## has it's own list of extra data it requires, this method allows each model to 
    ## extract that from the params passed into the controller and store in the data field.
    ## This method just needs to return a Hash, that is then converted to JSON and stored
    ## in the data field. The data can then be retreived using extra_data method.
    def extract_data_from_params(params)
      nil
    end
    
    # this should not be overridden and provides a single-point of implementation.
    def params_to_data(params)
      extract_data_from_params(params).to_json
    end
    
    ## Override this method and return the name of the class that is used in the
    ## editor to represent this class.
    def _type
      "PageElement"
    end
  end

  def extra_data
    JSON.parse(data)
  end

  def store_extra_data(hsh)
    update_attributes(:data => hsh.to_json)
  end

  # this is the same name as the variable in the page_element.j class in the editor.
  # Used to convert an object to json for recreation in the editor.
  def _json
    ## override to produce json that can be used to initialize corresponding objects in
    ## the editor.
    extra_data
  end

  # used by Page#to_json_for_editor to return the corresponding editor class for this
  # object. Don't override this method, rather the corresponding class method _type.
  def _type
    self.class._type
  end
  
  # when we clone ourself, ensure that we maintain a reference to the original
  def clone
    p = super
    p.original = self
    p
  end
  
  # this is called once an entire publication or page of a publication has been cloned
  # and we need to update references (i.e. explicitly page element ids that are stored
  # as part of the page elements' data, e.g. you_tube_seek_to_link_element).
  def update_references(new_publication) ; end
  
  # return hash containing the raw data for this object.
  def to_json_for_editor
    JSON.parse(to_json(:methods => ['_type', '_json'], 
                       :except => ['created_at', 'updated_at', 'data', 
                                   'page_id', 'id_str', 'state']))[self.class.name.underscore]
  end
  
  def dump_to_pdf(pdf)
    # needs to be implemented by subclasses
    pdf.bounding_box([x,y], :width => width, :height => height) do
      pdf.font_size 10 do
        pdf.text "UNABLE To represent Object with Class: '" + self.class.name + "'"
      end
    end
  end
  
  def css_style
    ('position: absolute; float: none; top: %0.2fpx; left: %0.2fpx; ' +
     'width: %0.2fpx; height: %0.2fpx; z-index: %d;') % [y, x, width, height, z_index]
  end
end
