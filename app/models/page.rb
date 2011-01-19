class Page < ActiveRecord::Base
  belongs_to :publication
  has_many :page_elements

  state_machine :state, :initial => :created do
    [:created, :editing, :published, :locked, :hidden, :deleted].each { |stat| state stat }

    ## TODO complete this. The point here is to support undo actions (yes even from the server
    ## TODO end). But we might not do it ....
  end
  
  def to_json_for_editor
    to_json(:except => ["created_at", "state", "updated_at", "publication_id"],
            :include => { :page_elements => {
                 :except => ["created_at", "page_id", "state", "updated_at", "data"],
                 :methods => ["type", "extra_data"]
               }})
  end
end
