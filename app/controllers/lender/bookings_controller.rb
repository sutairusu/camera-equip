class Lender::BookingsController < ApplicationController
  def index
    # @bookings = Booking.where(lender_id: current_user.id)
    @bookings = policy_scope([:lender, Booking])
  end
end
