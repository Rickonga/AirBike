class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @bikes = policy_scope(Bike)
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    authorize @bike

    if @bike.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:model, :brand, :description, :address, :price, :category)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
