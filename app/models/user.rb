class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :snippets
  has_many :comments
  has_many :favorite_snippets
  has_many :favorites, through: :favorite_snippets
  has_many :teams, through: :joinings
end
