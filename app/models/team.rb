class Team < ActiveRecord::Base
  has_many :users, through: :joinings
end
