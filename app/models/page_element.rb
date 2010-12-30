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
    ## extract that from the params passed into the controller.
    def extract_data_from_params(params)
      nil
    end
  end
  
  def extra_data
    JSON.parse(data)
  end

  def dump_to_pdf(pdf)
    # needs to be implemented by subclasses
  end
end
