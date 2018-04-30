class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  validates_associated :cart_items

  def add_product(dish)
    current_item = cart_items.find_by(dish_id: dish.id)
    if (current_item)
      current_item.quantity += 1
    else
      current_item = cart_items.build(dish_id: dish.id)
      current_item.price = dish.price
    end
    current_item
  end

  def total_price
    cart_items.to_a.sum{ |item|
        item.total_price
    }
  end
  
end
