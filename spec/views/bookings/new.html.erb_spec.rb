require 'rails_helper'

RSpec.describe "bookings/new", type: :view do
  before(:each) do
    assign(:booking, Booking.new(
      :user_id => 1,
      :guess_id => 1,
      :place => "MyString",
      :status => false,
      :action => 1
    ))
  end

  it "renders new booking form" do
    render

    assert_select "form[action=?][method=?]", bookings_path, "post" do

      assert_select "input[name=?]", "booking[user_id]"

      assert_select "input[name=?]", "booking[guess_id]"

      assert_select "input[name=?]", "booking[place]"

      assert_select "input[name=?]", "booking[status]"

      assert_select "input[name=?]", "booking[action]"
    end
  end
end
