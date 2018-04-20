require 'rails_helper'

RSpec.describe "admin/dishes/index", type: :view do
  before(:each) do
    assign(:dishes, [
      Dish.create!(),
      Dish.create!()
    ])
  end

  it "renders a list of admin/dishes" do
    render
  end
end
