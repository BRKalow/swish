require 'file_size_validator'
class Team < ActiveRecord::Base
  has_many :joinings, dependent: :destroy
  has_many :members, lambda {
                        where(joinings: {
                                status: Joining.statuses[:accepted]
                              })
                     }, through: :joinings, source: :user
  has_many :pending, lambda {
                        where(joinings: {
                                status: Joining.statuses[:pending]
                              })
                     }, through: :joinings, source: :user
  has_one :owner, class_name: 'User', foreign_key: :id, primary_key: :owner_id
  has_many :snippets

  mount_uploader :picture, TeamPictureUploader

  validates :picture, file_size: { maximum: 5.megabytes.to_i }

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_integrity_of :picture
  validates_processing_of :picture

  before_create :permalink_name
  after_create :create_owner_joining

  def to_param
    permalink
  end

  private

  def permalink_name
    self.permalink = name.parameterize
  end

  def create_owner_joining
    joining = Joining.new
    joining.user = owner
    joining.team = self
    joining.accepted!
  end
end
