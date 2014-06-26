class DropBars < ActiveRecord::Migration
  def change
  	drop_table :bars
  end
end
