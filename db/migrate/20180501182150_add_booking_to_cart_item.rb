class AddBookingToCartItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :cart_items, :cart_items, foreign_key: true
  end
end
