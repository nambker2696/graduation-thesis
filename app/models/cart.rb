class Cart < ApplicationRecord
  has_many :cart_items

  def add_product(dish_params)
    current_item = cart_items.find_by(dish_id: dish_params[:dish_id])

    if (current_item)
      current_item.quantity += 1
    else
      current_item = cart_items.create( dish_id: dish_params[:dish][:dish_id],
                                    quantity: product_params[:dish][:quantity],
                                    cart_id: self.id)
    end
    current_item
  end
  
end
