class Dish < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :location
  has_many :bookings, through: :cart_items
end
