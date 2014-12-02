class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :snippets
  has_many :comments
  has_many :favorite_snippets
  has_many :favorites, through: :favorite_snippets, source: :snippet
  has_many :joinings
  has_many :teams, through: :joinings

  validates_presence_of :username
  validates_uniqueness_of :email, :username

  before_create :permalink_name

  def to_param
    self.permalink
  end

  private

  def permalink_name
    self.permalink = self.username.parameterize
  end
end
