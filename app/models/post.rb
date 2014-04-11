class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 180 }
  validates :category, presence: true

  acts_as_voteable

  geocoded_by :address
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  belongs_to :user
  has_many :comments
end
