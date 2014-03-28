class Comment < ActiveRecord::Base
  validates :post_id, presence: true
  validates :body, presence: true
end
