class HomeController < ApplicationController
  before_action :set_cart
  def index; 
      @dishs = Dish.all
      @categories = Category.all
  end

  def locations; end

  def about; end

  def contact; end
end
