class AddDataToPublications < ActiveRecord::Migration
  def self.up
    add_column :publications, :data, :text
  end

  def self.down
    remove_column :publications, :data
  end
end
