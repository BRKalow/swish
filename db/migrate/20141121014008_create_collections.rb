class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.references :user, index: true
      t.integer :num_snippets
      t.integer :num_likes

      t.timestamps
    end
  end
end
