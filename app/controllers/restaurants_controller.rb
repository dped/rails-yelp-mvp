class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show]

  # read all restaurants, plural
  def index
    @restaurants = Restaurant.all
  end

  # read one restaurant, singular
  def show
  end

  # add a new restaurant to the show view
  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    restaurant.save
    redirect_to restaurants_path
  end

  private

  def set_restaurant
      @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:name).permit(:title, :details, :completed)
  end
end
