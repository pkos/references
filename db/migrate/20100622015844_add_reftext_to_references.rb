class AddReftextToReferences < ActiveRecord::Migration
  def self.up
    add_column :references, :reftext, :text
  end

  def self.down
    remove_column :references, :reftext
  end
end
