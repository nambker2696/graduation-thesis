class OpeningHour < ApplicationRecord
  belongs_to :location
  has_one :store, through: :location
end
