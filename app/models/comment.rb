class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet

  validates_presence_of :body

  after_create :increment_snippet!

  private

  def increment_snippet!
    snippet.num_comments += 1
    snippet.save!
  end
end
