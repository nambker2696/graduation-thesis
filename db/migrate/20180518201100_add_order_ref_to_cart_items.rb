class AddOrderRefToCartItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :cart_items, :order, foreign_key: true
  end
end
