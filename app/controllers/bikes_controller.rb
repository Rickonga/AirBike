class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_bike, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      sql_query = "model ILIKE :query OR address ILIKE :query"
      @bikes = policy_scope(Bike.geocoded.where(sql_query, query: "%#{params[:query]}%"))
      @markers = @bikes.map do |bike|
        {
          lat: bike.latitude,
          lng: bike.longitude
        }
      end
    else
      @bikes = policy_scope(Bike.geocoded)

      @markers = @bikes.map do |bike|
        {
          lat: bike.latitude,
          lng: bike.longitude
        }
      end
    end
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
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def show
    authorize @bike
    @marker = {
      lat: @bike.latitude,
      lng: @bike.longitude
    }
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

  def mybikes
    @bikes = Bike.geocoded.where(user: current_user)
    authorize @bikes
    @markers = @bikes.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude
      }
    end
    render 'bikes/index'
  end

  private

  def bike_params
    params.require(:bike).permit(:model, :brand, :description, :address, :price, :category_id, :photo)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
