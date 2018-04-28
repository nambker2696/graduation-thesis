class CreateBookingDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_details do |t|
      t.integer :user_id
      t.integer :booking_id
      t.integer :dish_id
      t.decimal :price

      t.timestamps
    end
  end
end
