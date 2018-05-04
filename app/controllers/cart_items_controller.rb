class CartItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_cart_item,only: [:show, :edit, :update, :destroy,:decrement]

  def create
    dish = Dish.find(params[:dish_id])
    @cart_item =  @cart.add_product(dish)
    session[:counter] = 0

    respond_to do |format|
      if @cart_item.save
        sweetalert_success('Your resource is created and available.', 'Successfully created', persistent: 'Awesome!')
        format.html { redirect_to carts_url }
        format.js { @current_item = @cart_item}
        format.json { render :show, status: :created, location: @cart_item }
      else
         format.html { render :new }  #点击过快会到这边
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      # byebug
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @cart_item.destroy
      respond_to do |format|
      sweetalert_success('Cart is delete', 'Successfully delete', persistent: 'Awesome!')
      redirect_to current_page_url
      format.html {  }#, notice: 'Line item was successfully destroyed.' }
      format.js {@current_item = @cart_item}
      format.json { head :no_content }
    end
  end

  def decrement
    @cart_item.decrement #see model
    respond_to do |format|
      if(@cart_item.save)
        sweetalert_success('CartItem is update', 'Successfully update', persistent: 'Awesome!')
        format.html {redirect_to current_page_url}
        format.js { @current_item = @cart_item}  #
        format.json {head:ok}
      else
        format.html { render action: "edit" }
        format.js {@current_item = @cart_item}
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:dish_id, :cart_id, :quantity)
  end

end