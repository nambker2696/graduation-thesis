require 'rails_helper'

RSpec.describe "admin/dishes/edit", type: :view do
  before(:each) do
    @admin_dish = assign(:admin_dish, Dish.create!())
  end

  it "renders the edit admin_dish form" do
    render

    assert_select "form[action=?][method=?]", admin_dish_path(@admin_dish), "post" do
    end
  end
end
