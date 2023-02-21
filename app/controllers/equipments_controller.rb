class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @equipments = policy_scope(Equipment)
  end

  def show
    @equipment = Equipment.find(params[:id])
    @booking = Booking.new
    authorize @equipment
  end

  def new
    @equipment = Equipment.new
    authorize @equipment
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user
    authorize @equipment
    if @equipment.save
      redirect_to equipment_path(@equipment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def equipment_params
    params.require(:equipment).permit(:model, :brand, :description, :price, photos: [])
  end
end