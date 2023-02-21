class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @equipment = Equipment.new
    authorize @equipment
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def equipment_params
    params.require(:booking).permit(:model, :brand, :description, :price, photos: [])
  end
end
