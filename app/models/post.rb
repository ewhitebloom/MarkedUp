class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :body, presence: true
  validates :category, presence: true

  acts_as_voteable

  belongs_to :user
  has_many :comments
end
