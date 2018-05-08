class Review < ApplicationRecord
  belongs_to :user
  belongs_to :location

  # has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy, as: :target
  CREATE_PARAMS = %i(
    title
    content
    location_id
    user_id
    rate_score
  ).freeze
end
