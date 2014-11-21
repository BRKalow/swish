class FavoriteSnippet < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet
end
