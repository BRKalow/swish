class CreateFavoriteSnippets < ActiveRecord::Migration
  def change
    create_table :favorite_snippets do |t|
      t.references :user, index: true
      t.references :snippet, index: true

      t.timestamps
    end
  end
end
