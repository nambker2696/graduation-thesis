class AddBookingRefToCartItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :cart_items, :booking, foreign_key: true
  end
end
