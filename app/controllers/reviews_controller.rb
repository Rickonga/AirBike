class ReviewsController < ApplicationController
  def create
    @bike = bike.find(params[:bike_id])
    @review = Review.new(review_params)
    @review.bike = @bike
    if @review.save
      redirect_to bike_path(@bike)
    else
      render 'bikes/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
