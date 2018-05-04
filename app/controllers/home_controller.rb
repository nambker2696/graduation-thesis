class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_cart
  def index; 
    @dishs =  Dish.all.page params[:page]
  end

  def about; end

  def contact; end
end
