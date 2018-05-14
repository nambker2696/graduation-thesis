class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_cart
  def index
    @dishs =  Dish.all.page params[:page]
  end

  def search
    @dishes = Dish.ransack(name_cont: params[:q]).result(distinct: true)
    @locations = Location.ransack(address_cont: params[:q]).result(distinct: true).page params[:page] 
    respond_to do |format| 
      format.html {}
      format.json {
        @locations = @locations.limit(5)
        @dishes = @dishes.limit(5)
      }
    end
  end
  def chef_signup
  end

  def about; end

  def contact; end 
end
