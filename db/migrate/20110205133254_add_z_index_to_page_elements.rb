class AddZIndexToPageElements < ActiveRecord::Migration
  def self.up
    add_column :page_elements, :z_index, :integer, :default => 0
  end

  def self.down
    remove_column :page_elements, :z_index
  end
end
