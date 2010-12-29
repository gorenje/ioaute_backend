class PageElement < ActiveRecord::Base
  belongs_to :page

  state_machine :state, :initial => :created do
    [:created, :editing, :published, :locked, :hidden, :deleted].each { |stat| state stat }

    ## TODO complete this. The point here is to support undo actions (yes even from the server
    ## TODO end). But we might not do it ....
  end

  def extra_data
    JSON.parse(data)
  end

  def dump_to_pdf(pdf)
    # needs to be implemented by subclasses
  end
end
