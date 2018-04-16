require 'rails_helper'

RSpec.describe "admin/bookings/index", type: :view do
  before(:each) do
    assign(:bookings, [
      Booking.create!(),
      Booking.create!()
    ])
  end

  it "renders a list of admin/bookings" do
    render
  end
end
