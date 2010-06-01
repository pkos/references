class CreateReferences < ActiveRecord::Migration
  def self.up
    create_table :references do |t|
      t.string :title
      t.string :authors
      t.string :abstract
      t.string :journal
      t.integer :pmid
      t.integer :user_id

      t.timestamps
    end
    add_index :references, :user_id
  end

  def self.down
    drop_table :references
  end
end
