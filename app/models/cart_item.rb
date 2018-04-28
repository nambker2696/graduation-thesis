class CartItem < ApplicationRecord
  belongs_to :booking, optional: true
  belongs_to :dish, optional: true, touch: true

  validates :dish, presence: true

  belongs_to :cart

  def total_price
    price * quantity
  end

  def decrement
    # byebug
    if(self.quantity > 1)
      self.quantity -= 1
    else
      self.destroy
    end
    self
  end




end
