class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @camera = Camera.new
    authorize @camera
  end

  def create
    # raise
    @booking = Booking.new(camera_params)
    @booking.user = current_user
    @booking.camera = Camera.find(params[:camera_id])
    @booking.status = false
    authorize @booking
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def camera_params
    params.require(:booking).permit(:from, :until)
  end
end
