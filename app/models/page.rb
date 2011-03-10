class Page < ActiveRecord::Base
  belongs_to :publication
  has_many :page_elements

  state_machine :state, :initial => :created do
    [:created, :editing, :published, :locked, :hidden, :deleted].each { |stat| state stat }

    ## TODO complete this. The point here is to support undo actions (yes even from the server
    ## TODO end). But we might not do it ....
  end
  
  class << self
    def create_copy(original_page, page_number)
      page_copy = original_page.clone
      page_copy.number = page_number
      page_copy.name = "Copy of %s" % original_page.name
      page_copy.save
      page_copy.page_elements = original_page.page_elements.map { |a| a.clone }
      page_copy
    end
  end
  
  def create_copy(page_number)
    Page.create_copy(self, page_number)
  end
  
  ## TODO this returns a hash not a string as to_json. This is because the controller 
  ## TODO creates a json string from all the data to be sent to the editor and this
  ## TODO is only one part.
  def to_json_for_editor
    hsh = JSON.parse(to_json(:except => ["created_at", "state", "updated_at", "publication_id"]))
    hsh["page"]["page_elements"] = page_elements.map { |a| a.to_json_for_editor }
    hsh
  end
  
  def is_landscape?
    orientation == "landscape"
  end

  def is_letter?
    size == "letter"
  end
  
  def css_class
    "page_%s%s" % [ is_letter? ? "letter" : "a4", is_landscape? ? "_landscape" : "" ]
  end
  
  def css_style
    "background-color: rgba(%s,%s,%s,%s);" % ["red", "green", "blue", "alpha"].map do |a| 
      self.send(a).to_s
    end
  end
end
