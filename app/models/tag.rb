class Tag < ActiveRecord::Base
  has_many :snippets, through: :taggings
end
