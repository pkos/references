class AddStyleToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :style, :string
  end

  def self.down
    remove_column :users, :style
  end
end
