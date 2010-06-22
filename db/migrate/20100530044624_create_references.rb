class CreateReferences < ActiveRecord::Migration
  def self.up
    create_table :references do |t|
      t.text :authors
      t.text :title
      t.text :journal
      t.text :volume
      t.text :issue
      t.text :pages
      t.text :year
      t.text :pubmed
      t.text :medline
      t.text :abstract
      t.text :url
      t.text :mesh
      t.text :affiliations
      t.integer :user_id

      t.timestamps
    end
    add_index :references, :user_id
  end

  def self.down
    drop_table :references
  end
end
