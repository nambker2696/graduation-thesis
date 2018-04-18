class Location < ApplicationRecord
  belongs_to :store
  has_many :openinghours
end
