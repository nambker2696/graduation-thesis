class Admin::DashboardController < Admin::BaseController
  def index
    if current_user.type_chef == 4
      @booking = Booking.all
      @order = Order.all
    else
      @booking = Booking.where(user_id: current_user)
      @order = Order.where(user_id: current_user)
    end
  end
end
