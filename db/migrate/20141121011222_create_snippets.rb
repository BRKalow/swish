class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.text :language
      t.text :title
      t.text :body
      t.integer :num_favorites
      t.integer :num_views
      t.integer :num_comments

      t.timestamps
    end
  end
end
