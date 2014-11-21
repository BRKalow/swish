class Snippet < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :favorite_snippets
  has_many :favorited_by, through: :favorite_recipe, source: :user
  has_and_belongs_to_many :collections
  has_many :tags, through: :taggings
end
