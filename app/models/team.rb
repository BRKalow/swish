class Team < ActiveRecord::Base
  has_many :joinings
  has_many :users, through: :joinings
end