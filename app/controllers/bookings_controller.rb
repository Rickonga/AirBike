class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_booking, only: %i[show]
  before_action :set_bike, only: %i[create]

  def index

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.price = @bike.price
    # authorize @bike
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :price, :user_id, :bike_id)
  end

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

end
