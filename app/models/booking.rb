class Booking < ApplicationRecord
  has_many :booking_details
  belongs_to :user
  has_many :dishs, through: :booking_details
  
  validates :delivery_type, :payment_type, presence: true
 
  DELIVERY_TYPES = ["Courier(DPD)", "Personal collection", "InPost"]
  PAYMENT_TYPES  = ["Cash On Delivery", "Bank Transfer", "Dotpay"]
end
