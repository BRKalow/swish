class RenameNumLikesToNumFavoritesCollection < ActiveRecord::Migration
  def change
    rename_column :collections, :num_likes, :num_favorites
  end
end
