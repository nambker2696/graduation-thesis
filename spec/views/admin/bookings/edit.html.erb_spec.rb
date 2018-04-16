require 'rails_helper'

RSpec.describe "admin/bookings/edit", type: :view do
  before(:each) do
    @admin_booking = assign(:admin_booking, Booking.create!())
  end

  it "renders the edit admin_booking form" do
    render

    assert_select "form[action=?][method=?]", admin_booking_path(@admin_booking), "post" do
    end
  end
end
