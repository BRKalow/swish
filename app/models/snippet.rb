class Snippet < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  has_many :comments
  has_many :favorite_snippets
  has_many :favorited_by, through: :favorite_snippets, source: :user
  has_and_belongs_to_many :collections
  acts_as_taggable

  has_default_values(
    num_favorites: 0,
    num_comments: 0,
    num_views: 0
  )

  default_scope { order(created_at: :desc) }

  validates_presence_of :title, :language, :body
end
