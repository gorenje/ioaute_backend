class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.string :uuid
      t.string :name
      t.string :topic
      t.string :state

      t.integer :editor_id

      t.datetime :deleted_at
      t.datetime :published_at
      t.datetime :locked_at

      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end
