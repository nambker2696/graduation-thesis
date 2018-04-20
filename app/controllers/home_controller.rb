# :nodoc:
class HomeController < ApplicationController
  def index; 
      @dish = Dish.all
  end

  def locations; end

  def about; end

  def contact; end
end
