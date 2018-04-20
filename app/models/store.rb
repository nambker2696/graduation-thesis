class Store < ApplicationRecord
  belongs_to :user
  has_many :locations
  has_many :openinghours, through: :locations

  has_many :categories


end
