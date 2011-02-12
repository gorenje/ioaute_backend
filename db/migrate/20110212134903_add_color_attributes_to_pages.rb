class AddColorAttributesToPages < ActiveRecord::Migration
  def self.up
    # default color is white.
    [:red, :green, :blue].each do |clrname|
      add_column :pages, clrname, :integer, :default => 255
    end
    add_column :pages, :alpha, :float, :default => 1.0

    # add defaults to size and orientation
    change_column :pages, :size, :string, :default => 'a4'
    change_column :pages, :orientation, :string, :default => 'portrait'
  end

  def self.down
    [:red, :green, :blue].each { |clrname| remove_column :pages, clrname }
    remove_column :pages, :alpha
  end
end
