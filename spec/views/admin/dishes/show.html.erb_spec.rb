require 'rails_helper'

RSpec.describe "admin/dishes/show", type: :view do
  before(:each) do
    @admin_dish = assign(:admin_dish, Dish.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
