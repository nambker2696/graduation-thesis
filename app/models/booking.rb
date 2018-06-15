class Booking < ApplicationRecord
  belongs_to :user
  has_many :dishs, through: :cart_items

  has_many :cart_items, dependent: :destroy
  
  validates :payment_type, presence: true


  PAYMENT_TYPES  = ["Cash On Delivery", "Bank Transfer", "Dotpay"]

  TIME_EATS = ["10:00", "12:00", "14:00", "16:00", "18:00", "20:00"]

  NUMBER_PEOPLE = ["1 people", "2 people", "3 people", "4 people", "5 people", "6 people", "7 people", "8 people", "9 people", "10 people"]
  
  NUMBER_CHILD = ["1 people", "2 people", "3 people", "4 people", "5 people", "6 people"]

  def add_cart_items_from_cart(cart)
    cart.cart_items.each do |item|
      item.cart_id = nil 
      cart_items << item
    end
  end
end
