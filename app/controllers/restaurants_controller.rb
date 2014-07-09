class RestaurantsController < ApplicationController
  before_filter :ensure_logged_in, :only => [:show]

  def index
    if params[:search]
      @restaurants = Restaurant.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:id])

  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id

    if @restaurant.save
      redirect_to restaurants_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurants_path(@restaurant)
    else 
      render :edit
    end 
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :capacity, :description)
  end


end
