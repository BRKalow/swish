class Joining < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  enum status: [:pending, :accepted]
end
