class ReservationsController < ApplicationController
	before_filter :load_restaurant

  def create
  	@reservation = @restaurant.reservations.new(reservation_params)
    @reservation.start_time = @reservation.start_time.change(min: 0, sec:0)
  	@reservation.user_id = current_user.id

    if @reservation.reserved?(current_user, @reservation.start_time)
      redirect_to @restaurant, notice: 'You can only have one reservation at a restaurant'
    elsif @reservation.available?(reservation_params[:number_of_patrons].to_i, @reservation.start_time) && @reservation.save
      redirect_to @restaurant, notice: "Successfully created reservation"
  	else 
  		redirect_to @restaurant, notice: "There are not enough spots at the restaurant for that hour"
  	end
  end

  def show
  	@reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to current_user, notice: "Reservation cancelled"
  end

  private
  def reservation_params
  	params.require(:reservation).permit(:start_time, :restaurant_id, :number_of_patrons)
  end

  def load_restaurant
  	@restaurant = Restaurant.find(params[:restaurant_id])
  end

end
