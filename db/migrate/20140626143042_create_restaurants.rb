class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :capacity
      t.string :description
      t.integer :user_id
      t.string :category

      t.timestamps
    end
  end
end
