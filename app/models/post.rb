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

  def self.search(search)
    if search
      where('body ILIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  # def self.clean
  #   if self.votes < 5 && Time.now -
  #   end
  # end
end
