class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @camera = Camera.new
    authorize @camera
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.camera = Camera.find(params[:camera_id])
    # @booking.status = false
    # We probably need to check whether the camera is actually available
    # If not, the user needs to be informed and redirected to the form
    authorize @booking
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render partial: 'equipments/form', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :from, :until)
  end
end
