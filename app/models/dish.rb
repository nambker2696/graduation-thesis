class Dish < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :booking_details
  has_many :bookings, through: :booking_details
  include Searchable
end
