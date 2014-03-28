class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :body, presence: true
  validates :category, presence: true
end
