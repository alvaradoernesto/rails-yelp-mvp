class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  # Strong Params
  # del hash params, requiero el key :task, y permito se escriban los siguientes :keys
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone, :review)
  end
end
