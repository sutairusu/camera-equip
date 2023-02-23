class Booking < ApplicationRecord
  belongs_to :camera
  belongs_to :user

  enum status: [ :pending, :accepted, :rejected ]
end
