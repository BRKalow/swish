class DropCollectionSnippetsTable < ActiveRecord::Migration
  def change
    drop_table :collections_snippets
  end
end
