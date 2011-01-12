class PageElement < ActiveRecord::Base
  belongs_to :page

  state_machine :state, :initial => :created do
    [:created, :editing, :published, :locked, :hidden, :deleted].each { |stat| state stat }

    ## TODO complete this. The point here is to support undo actions (yes even from the server
    ## TODO end). But we might not do it ....
  end

  class << self
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
    
    # don't take 'isa' on face value, check whether we have a corresponding class
    # for the isa value.
    def class_for_isa(isa_str)
      case isa_str  
      when "Facebook"      then FacebookElement
      when "Tweet"         then TwitterElement
      when "Flickr"        then FlickrElement
      when "ImageTE"       then ImageElement
      when "LinkTE"        then LinkElement
      when "TextTE"        then TextElement
      when "FbLikeTE"      then FbLikeElement
      when "DiggButtonTE"  then DiggButtonElement
      when "TwitterFeedTE" then TwitterFeedElement
      else 
        "UnknownClass#{params[:isa]}"
      end
    end
  end
  
  def extra_data
    JSON.parse(data)
  end

  def store_extra_data(hsh)
    update_attributes(:data => hsh.to_json)
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
