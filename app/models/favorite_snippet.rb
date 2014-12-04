class FavoriteSnippet < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet

  after_create :increment_snippet!

  private

  def increment_snippet!
    snippet.num_favorites += 1
    snippet.save!
  end
end
