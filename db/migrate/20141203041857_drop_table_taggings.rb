class DropTableTaggings < ActiveRecord::Migration
  def change
    drop_table :taggings
  end
end
