class RemoveBarIdFromReviews < ActiveRecord::Migration
  def change
  	remove_column :reviews, :bar_id, :integer
  	add_column :reviews, :restaurant_id, :integer
  end
end
