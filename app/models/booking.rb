class Booking < ApplicationRecord
  belongs_to :camera
  belongs_to :user
  attribute :status, :boolean, default: false
end
