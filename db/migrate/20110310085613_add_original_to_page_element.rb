class AddOriginalToPageElement < ActiveRecord::Migration
  def self.up
    add_column :page_elements, :original_id, :integer
  end

  def self.down
    remove_column :page_elements, :original_id
  end
end
