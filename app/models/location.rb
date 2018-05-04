class Location < ApplicationRecord
  has_many :openinghours
  has_many :seatings
  has_many :timeslots
  has_many :dishs
  belongs_to :user
  has_many :likes, dependent: :destroy, as: :target
end
  