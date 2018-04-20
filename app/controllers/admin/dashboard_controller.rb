class Admin::DashboardController < Admin::BaseController
  
  def index
    @order = Order.all
    @pickups = Order.all
    @deliveri = Order.all 
  end
end
