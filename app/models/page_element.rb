class PageElement < ActiveRecord::Base
  belongs_to :page

  @@lokuptable = nil
  
  state_machine :state, :initial => :created do
    [:created, :editing, :published, :locked, :hidden, :deleted].each { |stat| state stat }

    ## TODO complete this. The point here is to support undo actions (yes even from the server
    ## TODO end). But we might not do it ....
  end

  class << self
    # Select the corresponding class for the element used in the editor. Don't take 'isa' 
    # on face value, check whether we have a corresponding mapping for the isa value.
    def class_for_isa(isa_str)
      (@@lokuptable || (@@lokuptable={
        "Facebook"      => FacebookElement,
        "Tweet"         => TwitterElement,
        "Flickr"        => FlickrElement,
        "ImageTE"       => ImageElement,
        "LinkTE"        => LinkElement,
        "TextTE"        => TextElement,
        "FbLikeTE"      => FbLikeElement,
        "DiggButtonTE"  => DiggButtonElement,
        "TwitterFeedTE" => TwitterFeedElement,
        "MoustacheTE"   => MoustacheElement,
        "HeaderTE"      => HeaderTextElement,
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
  
  def dump_to_pdf(pdf)
    # needs to be implemented by subclasses
    pdf.bounding_box([x,y], :width => width, :height => height) do
      pdf.font_size 10 do
        pdf.text "UNABLE To represent Object with Class: '" + self.class.name + "'"
      end
    end
  end
  
  def css_style
    "position: absolute; float: none; top: %dpx; left: %dpx; width: %dpx; height: %dpx;" % [y, x, width, height].map(&:to_i)
  end
end
