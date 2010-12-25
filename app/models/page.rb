class Page < ActiveRecord::Base
  belongs_to :publication
  has_many :page_elements
end
