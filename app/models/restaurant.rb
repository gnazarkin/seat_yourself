class Restaurant < ActiveRecord::Base
	validates :name, :description, :address, :capacity, :presence => true
	validates :capacity, :numericality => {:only_integer => true}
end
