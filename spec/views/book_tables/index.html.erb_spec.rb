require 'rails_helper'

RSpec.describe "book_tables/index", type: :view do
  before(:each) do
    assign(:book_tables, [
      BookTable.create!(
        :user_id => 2,
        :guess_id => 3,
        :total_price => 4.5,
        :status => false
      ),
      BookTable.create!(
        :user_id => 2,
        :guess_id => 3,
        :total_price => 4.5,
        :status => false
      )
    ])
  end

  it "renders a list of book_tables" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
