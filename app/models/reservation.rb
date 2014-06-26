class Reservation < ActiveRecord::Base
	belongs_to :users
	belongs_to :restaurants

	has_many :reviews
end
