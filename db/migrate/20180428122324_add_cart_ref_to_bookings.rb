class AddCartRefToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :cart, foreign_key: true
  end
end
