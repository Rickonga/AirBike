class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_bike, only: %i[destroy]

  def index
    @bikes = policy_scope(Bike)
  end

  def show
    authorize @bike
  end

  def destroy
    authorize @bike
    @bike.destroy
    redirect_to root_path
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
