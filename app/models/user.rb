class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  acts_as_voter

  validates :address, presence: true
  validates :first, presence: true
  validates :last, presence: true

  geocoded_by :address
  after_validation :geocode

  def full_name
    self.first + ' ' + self.last
  end
end
