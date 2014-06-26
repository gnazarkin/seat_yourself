class CreateRevews < ActiveRecord::Migration
  def change
    create_table :revews do |t|
      t.integer :user_id
      t.integer :bar_id
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
