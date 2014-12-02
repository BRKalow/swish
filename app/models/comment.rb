class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet

  after_create :increment_snippet!

  private

  def increment_snippet!
    self.snippet.num_comments += 1
    self.snippet.save!
  end
end
