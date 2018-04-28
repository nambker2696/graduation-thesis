class Timeslot < ApplicationRecord
  belongs_to :location
  has_many :seatings
end
