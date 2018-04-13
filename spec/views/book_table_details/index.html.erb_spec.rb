require 'rails_helper'

RSpec.describe "book_table_details/index", type: :view do
  before(:each) do
    assign(:book_table_details, [
      BookTableDetail.create!(
        :user_id => 2,
        :book_table_id => 3,
        :dish_id => 4,
        :price => 5.5
      ),
      BookTableDetail.create!(
        :user_id => 2,
        :book_table_id => 3,
        :dish_id => 4,
        :price => 5.5
      )
    ])
  end

  it "renders a list of book_table_details" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
  end
end
