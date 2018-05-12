class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_cart
  def index; 
    @dishs =  Dish.all.page params[:page]
  end

  def search
    @dishes = Dish.ransack(name_cont: params[:q]).result(distinct: true)
    #  search toan bo
    @locations = Location.ransack(address_cont: params[:q]).result(distinct: true) 
    respond_to do |format| 
    format.html {}
    format.json {
        @dishes = @dishes.limit(5)
        @locations = @locations.limit(5)
    }
    end
  end

  def about; end

  def contact; end 
end
