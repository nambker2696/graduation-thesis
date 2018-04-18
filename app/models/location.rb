class Location < ApplicationRecord
  has_many :openinghours
  belongs_to :store
end
