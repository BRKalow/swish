class CreateCollectionsSnippets < ActiveRecord::Migration
  def change
    create_table :collections_snippets do |t|
      t.belongs_to :snippet
      t.belongs_to :collection
    end
  end
end
