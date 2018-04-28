require 'rails_helper'

RSpec.describe "cart_items/show", type: :view do
  before(:each) do
    @cart_item = assign(:cart_item, CartItem.create!(
      :dish_id => 2,
      :cart_id => 3,
      :quantity => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
