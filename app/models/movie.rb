class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, :overview, uniqueness: true
  validates :title, :overview, :poster_url, presence: true

end
