require 'rails_helper'

RSpec.describe "dishes/edit", type: :view do
  before(:each) do
    @dish = assign(:dish, Dish.create!(
      :name => "MyString",
      :display_name => "MyString",
      :subtitle => "",
      :price => 1.5,
      :description => "MyString",
      :category_id => 1,
      :tags => "MyString"
    ))
  end

  it "renders the edit dish form" do
    render

    assert_select "form[action=?][method=?]", dish_path(@dish), "post" do

      assert_select "input[name=?]", "dish[name]"

      assert_select "input[name=?]", "dish[display_name]"

      assert_select "input[name=?]", "dish[subtitle]"

      assert_select "input[name=?]", "dish[price]"

      assert_select "input[name=?]", "dish[description]"

      assert_select "input[name=?]", "dish[category_id]"

      assert_select "input[name=?]", "dish[tags]"
    end
  end
end
