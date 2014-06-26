class RemoveBarIdAddRestaurantId < ActiveRecord::Migration
  def change
  	add_column :reservations, :restaurant_id, :integer
  	remove_column :reservations, :bar_id, :integer
  end
end
