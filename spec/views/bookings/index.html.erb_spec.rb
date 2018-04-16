require 'rails_helper'

RSpec.describe "bookings/index", type: :view do
  before(:each) do
    assign(:bookings, [
      Booking.create!(
        :user_id => 2,
        :guess_id => 3,
        :place => "Place",
        :status => false,
        :action => 4
      ),
      Booking.create!(
        :user_id => 2,
        :guess_id => 3,
        :place => "Place",
        :status => false,
        :action => 4
      )
    ])
  end

  it "renders a list of bookings" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Place".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
