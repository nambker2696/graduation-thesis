class Review < ApplicationRecord
  belongs_to :user
  belongs_to :location

  # has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy, as: :target
end
