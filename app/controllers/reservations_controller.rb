class ReservationsController < ApplicationController
	before_filter :load_restaurant

  def create
  	@reservation = @restaurant.reservations.new(reservation_params)
  	@reservation.user_id = current_user.id

  	if @reservation.save
  		render 'restaurants/show', notice: "Successfully created reservratio"
  	else 
  		flash.now[:alert] = "Your reservation failed to save"
  		render 'restaurants/show'
  	end
  end

  def show
  	@reservation = Reservation.find(params[:id])
  end

  def destroy
  end

  private
  def reservation_params
  	params.require(:reservation).permit(:start_time, :restaurant_id, :number_of_patrons)
  end

  def load_restaurant
  	@restaurant = Restaurant.find(params[:restaurant_id])
  end

end
