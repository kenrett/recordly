class Album < ActiveRecord::Base
  has_many :songs
  # has_many :artists
  validates :title, presence: true, uniqueness: true
end
