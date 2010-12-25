class CreateEditors < ActiveRecord::Migration
  def self.up
    create_table :editors do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :editors
  end
end
