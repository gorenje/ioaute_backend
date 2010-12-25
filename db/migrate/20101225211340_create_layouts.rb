class CreateLayouts < ActiveRecord::Migration
  def self.up
    create_table :layouts do |t|
      t.string :type
      t.text :data

      t.timestamps
    end
  end

  def self.down
    drop_table :layouts
  end
end
