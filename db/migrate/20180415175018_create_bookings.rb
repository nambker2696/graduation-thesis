class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :guess_id
      t.string :place
      t.boolean :status
      t.date :date_booked
      t.date :date_receipt
      t.integer :action

      t.timestamps
    end
  end
end
