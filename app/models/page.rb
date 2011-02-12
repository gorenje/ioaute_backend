class Page < ActiveRecord::Base
  belongs_to :publication
  has_many :page_elements

  state_machine :state, :initial => :created do
    [:created, :editing, :published, :locked, :hidden, :deleted].each { |stat| state stat }

    ## TODO complete this. The point here is to support undo actions (yes even from the server
    ## TODO end). But we might not do it ....
  end
  
  def to_json_for_editor
    ## TODO fix this hack: to_json_for_editor should return a hash since it's incorporated
    ## TODO into a hash and then converted to Json. What happens now is that this data
    ## TODO is sent as a string and then would need to be parsed on the other side (again).
    JSON.parse(to_json(:except => ["created_at", "state", "updated_at", "publication_id"],
                       :include => { :page_elements => {
                           :except => ["created_at", "page_id", "state", "updated_at", "data", "id_str"],
                           :methods => ["_type", "_json"]
                         }}))
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
