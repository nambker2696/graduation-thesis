class Store < ApplicationRecord
  validates :subdomain, 
            exclusion: { in: %w(www), 
            message: "%{value} is reserved." }, 
            presence: true, 
            uniqueness: true
  before_validation :sanitize_subdomain

  belongs_to :user
  has_many :locations
  has_many :openinghours, through: :locations

  has_many :categories

  def sanitize_subdomain
    self.subdomain = self.subdomain.parameterize
  end
end
