class Camera < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :model, :brand, :description, :price, :photos, presence: true
  validate :only_4_pictures

  def only_4_pictures
    errors.add(:photos, "should be less than 4") if photos.length > 4
  end
end
