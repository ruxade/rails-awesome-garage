class ReviewsController < ApplicationController

  # def new
  #   @review = Review.new

  # end

  def create
    @car = Car.find(params[:car_id])
    @review = @car.reviews.new(review_params)

    if @review.save
      redirect_to car_path(@car), notice: 'Review was successfully created.'
    else
      render 'cars/show' # Render the car show page again to show validation errors
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
