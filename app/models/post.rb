class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 180 }
  validates :category, presence: true
  validates :address, presence: true

  acts_as_voteable

  geocoded_by :address
  after_validation :geocode

  belongs_to :user
  has_many :comments
end
