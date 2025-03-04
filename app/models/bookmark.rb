class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  has_many_attached :photos
  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id,
  message: "You already have this movie bookmarked!" }
end
