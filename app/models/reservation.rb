class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	has_many :reviews

	def available?(party_size, start_time)
		restaurant.reservations.where(start_time: start_time).sum(:number_of_patrons) + party_size <= restaurant.capacity
	end

	def reserved?(current_user, start_time)
		restaurant.reservations.where(start_time: start_time, user_id: user.id).exists?
	end

end
