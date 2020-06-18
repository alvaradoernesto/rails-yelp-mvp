class ReviewsController < ApplicationController
  before_action :set_restaurant

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    if @review.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  # Strong Params
  # del hash params, requiero el key :task, y permito se escriban los siguientes :keys
  def review_params
    params.require(:review).permit(:restaurant_id, :content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
