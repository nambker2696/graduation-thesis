class DishesController < ApplicationController
  skip_before_action :authenticate_user!
  attr_reader :dish, :location
  
  def show
    @dish = Dish.find(params[:id])
    @location = Location.find_by id: params[:location_id] 
    @store_owner = User.find_by id: @location.user_id
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :display_name, :subtitle,:price,:description,:category_id,:tags,:image)
  end
end
