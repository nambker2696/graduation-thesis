require 'rails_helper'

RSpec.describe "cart_items/edit", type: :view do
  before(:each) do
    @cart_item = assign(:cart_item, CartItem.create!(
      :dish_id => 1,
      :cart_id => 1,
      :quantity => 1
    ))
  end

  it "renders the edit cart_item form" do
    render

    assert_select "form[action=?][method=?]", cart_item_path(@cart_item), "post" do

      assert_select "input[name=?]", "cart_item[dish_id]"

      assert_select "input[name=?]", "cart_item[cart_id]"

      assert_select "input[name=?]", "cart_item[quantity]"
    end
  end
end
