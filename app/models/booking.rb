class Booking < ApplicationRecord
  belongs_to :user
  has_many :dishs, through: :cart_items

  has_many :cart_items, dependent: :destroy
  
  validates :payment_type, presence: true

  PAYMENT_TYPES  = ["Cash On Delivery", "Bank Transfer", "Dotpay"]

  def add_cart_items_from_cart(cart)
    cart.cart_items.each do |item|
      item.cart_id = nil 
      cart_items << item
    end
  end
end
