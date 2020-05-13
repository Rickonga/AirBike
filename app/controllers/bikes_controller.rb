class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_bike, only: %i[show edit update destroy]

  def index
    @bikes = policy_scope(Bike)
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    authorize @bike

    if @bike.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    authorize @bike
  end

  def edit
    authorize @bike
  end

  def update
    authorize @bike
    if @bike.update(bike_params)
      redirect_to bike_path(@bike)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @bike
    @bike.destroy
    redirect_to root_path
  end

  private

  def bike_params
    params.require(:bike).permit(:model, :brand, :description, :address, :price, :category)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
