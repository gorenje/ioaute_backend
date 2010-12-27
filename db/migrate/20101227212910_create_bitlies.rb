class CreateBitlies < ActiveRecord::Migration
  def self.up
    create_table :bitlies do |t|
      t.integer :publication_id
      
      t.text :long_url
      t.string :short_url
      t.string :hash
      t.string :global_hash
      
      t.timestamps
    end

    add_index :bitlies, :short_url
  end

  def self.down
    drop_table :bitlies
  end
end
