class HomeController < ApplicationController
  skip_before_action :authorize
  before_action :set_cart
  def index; 
      @dishs = Dish.all
  end

  def locations; end

  def about; end

  def contact; end
end
