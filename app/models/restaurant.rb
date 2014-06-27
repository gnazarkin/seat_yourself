class Restaurant < ActiveRecord::Base
	validates :name, :description, :address, :capacity, :presence => true
	validates :capacity, :numericality => {:only_integer => true}

	has_many :reservations
	belongs_to :user
end
