class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.integer :user_id
      t.integer :bar_id
      t.integer :number_of_patrons

      t.timestamps
    end
  end
end
