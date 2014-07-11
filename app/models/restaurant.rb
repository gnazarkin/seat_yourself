class Restaurant < ActiveRecord::Base
	validates :name, :description, :address, :capacity, :presence => true
	validates :capacity, :numericality => {:only_integer => true}

	has_many :reservations
	belongs_to :user
	geocoded_by :get_address
	before_save :geocode
	has_many :reviews


  def get_address
    self.address
  end
end
