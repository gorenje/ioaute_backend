class AddColorAttributesToPages < ActiveRecord::Migration
  def self.up
    # default color is white.
    [:red, :green, :blue].each do |clrname|
      add_column :pages, clrname, :integer, :default => 255
    end
    add_column :pages, :alpha, :float, :default => 1.0
  end

  def self.down
    [:red, :green, :blue].each { |clrname| remove_column :pages, clrname }
    remove_column :pages, :alpha
  end
end
