require 'rails_helper'

RSpec.describe "cart_items/index", type: :view do
  before(:each) do
    assign(:cart_items, [
      CartItem.create!(
        :dish_id => 2,
        :cart_id => 3,
        :quantity => 4
      ),
      CartItem.create!(
        :dish_id => 2,
        :cart_id => 3,
        :quantity => 4
      )
    ])
  end

  it "renders a list of cart_items" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
