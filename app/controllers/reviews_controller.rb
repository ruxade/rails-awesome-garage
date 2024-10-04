class ReviewsController < ApplicationController

  # def new
  #   @review = Review.new

  # end

  def create
    @car = Car.find(params[:car_id])
    @review = Review.new(review_params)
    @review.car = @car

    if @review.save
      redirect_to car_path(@car), notice: 'Review was successfully created.'
    else
      render 'cars/show', status: :unprocessable_entity # Render the car show page again to show validation errors
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
