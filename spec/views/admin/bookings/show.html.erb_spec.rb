require 'rails_helper'

RSpec.describe "admin/bookings/show", type: :view do
  before(:each) do
    @admin_booking = assign(:admin_booking, Booking.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
