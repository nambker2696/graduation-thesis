class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_cart_item,only: [:show, :edit, :update, :destroy,:decrement]

  def create
    dish = Dish.find(params[:dish_id])
    @cart_item =  @cart.add_product(dish)
    session[:counter] = 0

    if @cart.save
      redirect_to root_url
    else
      flash[:error] = 'There was a problem adding this item to your cart'
      redirect_to @cart_item.errors
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path
  end

  private

    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def cart_item_params
      params.require(:cart_item).permit(:dish_id, :cart_id, :quantity)
    end

end