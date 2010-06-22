class AddBlobToReferences < ActiveRecord::Migration
  def self.up
    add_column :references, :refblob, :bytea
  end

  def self.down
    remove_column :references, :refblob
  end
end
