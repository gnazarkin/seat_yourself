class Reservation < ActiveRecord::Base
	belongs_to :restaurant, :user
end
