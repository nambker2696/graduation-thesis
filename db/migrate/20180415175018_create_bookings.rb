class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :table_number
      t.date :day_to_eat
      t.integer :number_people
      t.integer :number_child
      t.boolean :status
      t.integer :action
      t.string :payment_type

      t.timestamps
    end
  end
end
