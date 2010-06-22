class AddBlobToReferences < ActiveRecord::Migration
  def self.up
    add_column :references, :refblob, :blob
  end

  def self.down
    remove_column :references, :refblob
  end
end
