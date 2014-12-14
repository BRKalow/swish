class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :snippets, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorite_snippets
  has_many :favorites, through: :favorite_snippets, source: :snippet
  has_many :joinings, dependent: :destroy
  has_many :teams, through: :joinings

  validates_presence_of :username
  validates_uniqueness_of :email, :username

  before_create :permalink_name

  def to_param
    permalink
  end

  def available_collections(snippet)
    collections.where.not(id: Storing.select(:collection_id).where(snippet_id: snippet.id))
  end

  private

  def permalink_name
    self.permalink = username.parameterize
  end
end
