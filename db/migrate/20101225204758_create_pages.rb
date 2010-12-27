class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :number
      t.integer :publication_id
      t.integer :layout_id
      t.string :name
      t.string :size
      t.string :orientation

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
