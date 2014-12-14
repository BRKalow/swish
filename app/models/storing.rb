class Storing < ActiveRecord::Base
  belongs_to :snippet
  belongs_to :collection

  after_create :increment_collection!

  private

  def increment_collection!
    collection.num_snippets += 1
    collection.save!
  end
end
