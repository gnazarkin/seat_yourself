class DropRevews < ActiveRecord::Migration
  def change
  	drop_table :revews, :bars
  end
end
