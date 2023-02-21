class EquipmentsController < ApplicationController
  def index

  end

  def show
    @equipment = Equipment.find(params[:id])
    authorize @equipment
  end
end
