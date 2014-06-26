class ReservationsController < ApplicationController
	before_filter :load_restaurant, :load_user

  def create
  	@reservation = @restaurant.reservations.new(reservation_params)
  	@reservartion.user_id = current_user.id

  	if @reservation.save
  		render @restaurant.show, notice: "Successfully created reservratio"
  	else 
  		flash.now[:alert] = "Your reservation failed to save"
  		render @restaurant.show
  	end
  end

  def show
  	@reservation = Reservration.find(params[:id])
  end

  def destroy
  end

  private
  def reservartion_params
  	params.require(:reservartion).permit(:start_time, :user_id, :bar_id, :number_of_patrons)
  end

end
