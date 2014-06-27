class User < ActiveRecord::Base
	has_secure_password
	validates :name, :email, :presence => true
	validates :email, uniqueness: {case_sensitive: false}
	has_many :reservations
	has_many :restaurants, :through => :reservations
end
