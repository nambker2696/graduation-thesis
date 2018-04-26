# :nodoc:
class HomeController < ApplicationController
  def index; 
      @dish = Dish.all
      @categories = Category.all
  end

  def locations; end

  def about; end

  def contact; end
end
