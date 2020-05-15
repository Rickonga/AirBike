class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  # before_action :set_booking, only: %i[show]
  before_action :set_bike, only: %i[create show]

  def index

  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.price = @bike.price
    @booking.user = current_user
    @booking.bike = @bike
    @marker = [{
      lat: @bike.latitude,
      lng: @bike.longitude
    }]
    @existing_booking = Booking.find_by(bike_id: @bike.id)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.price = @bike.price
    @booking.user = current_user
# <<<<<<< HEAD
    @booking.bike = @bike
    if @booking.save
      redirect_to bike_booking_path(@bike, @booking)
    else
      redirect_to bike_path(@bike)
    end
    authorize @booking
# =======
#     if @booking.save
#       redirect_to bike_path(@bike)
#     else
#       render "bikes/show"
#     end
# >>>>>>> 5cbab61bdf85857355f3e0a2bcedf6ad6bac3f56
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :price, :user_id, :bike_id)
  end

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

end
