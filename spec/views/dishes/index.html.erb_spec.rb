require 'rails_helper'

RSpec.describe "dishes/index", type: :view do
  before(:each) do
    assign(:dishes, [
      Dish.create!(
        :name => "Name",
        :display_name => "Display Name",
        :subtitle => "",
        :price => 2.5,
        :description => "Description",
        :category_id => 3,
        :tags => "Tags"
      ),
      Dish.create!(
        :name => "Name",
        :display_name => "Display Name",
        :subtitle => "",
        :price => 2.5,
        :description => "Description",
        :category_id => 3,
        :tags => "Tags"
      )
    ])
  end

  it "renders a list of dishes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Display Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Tags".to_s, :count => 2
  end
end
