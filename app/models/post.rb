class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 180 }
  validates :category, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  acts_as_voteable

  belongs_to :user
  has_many :comments
end
