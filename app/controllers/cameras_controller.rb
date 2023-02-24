class CamerasController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @cameras = policy_scope(Camera)
  end

  def show
    @camera = Camera.find(params[:id])
    @booking = Booking.new
    authorize @camera
  end

  def new
    @camera = Camera.new
    authorize @camera
  end

  def create
    @camera = Camera.new(camera_params)
    @camera.user = current_user
    authorize @camera
    if @camera.save
      redirect_to cameras_path(@camera)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def camera_params
    params.require(:camera).permit(:model, :brand, :description, :price, photos: [])
  end
end
