require 'rails_helper'

RSpec.describe "bookings/show", type: :view do
  before(:each) do
    @booking = assign(:booking, Booking.create!(
      :user_id => 2,
      :guess_id => 3,
      :place => "Place",
      :status => false,
      :action => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Place/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/4/)
  end
end
