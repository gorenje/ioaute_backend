class CreatePageElements < ActiveRecord::Migration
  def self.up
    create_table :page_elements do |t|
      t.integer :page_id
      t.string :type
      t.float :width
      t.float :height
      t.float :x
      t.float :y
      t.string :id_str
      t.string :state
      t.text :data
      
      t.timestamps
    end
  end

  def self.down
    drop_table :page_elements
  end
end
