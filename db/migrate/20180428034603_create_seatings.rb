class CreateSeatings < ActiveRecord::Migration[5.1]
  def change
    create_table :seatings do |t|
      t.string :seat_name
      t.integer :location_id
      t.integer :floor
      t.string :description

      t.timestamps
    end
  end
end
