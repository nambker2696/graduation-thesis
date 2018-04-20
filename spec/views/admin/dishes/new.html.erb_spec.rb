require 'rails_helper'

RSpec.describe "admin/dishes/new", type: :view do
  before(:each) do
    assign(:admin_dish, Dish.new())
  end

  it "renders new admin_dish form" do
    render

    assert_select "form[action=?][method=?]", dishes_path, "post" do
    end
  end
end
