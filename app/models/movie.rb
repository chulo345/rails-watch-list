class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, uniqueness: true, presence: true
  validates :overview, :title, presence: true
end
