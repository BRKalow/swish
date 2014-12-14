class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :storings, dependent: :destroy
  has_many :snippets, through: :storings

  acts_as_taggable

  has_default_values(
    num_snippets: 0,
    num_favorites: 0
  )
end
