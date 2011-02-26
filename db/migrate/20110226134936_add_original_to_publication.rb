class AddOriginalToPublication < ActiveRecord::Migration
  def self.up
    add_column :publications, :original_id, :integer
  end

  def self.down
    remove_column :publications, :original_id
  end
end
