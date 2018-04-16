require 'rails_helper'

RSpec.describe "admin/bookings/new", type: :view do
  before(:each) do
    assign(:admin_booking, Booking.new())
  end

  it "renders new admin_booking form" do
    render

    assert_select "form[action=?][method=?]", bookings_path, "post" do
    end
  end
end
