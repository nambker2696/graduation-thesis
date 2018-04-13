require 'rails_helper'

RSpec.describe "book_table_details/edit", type: :view do
  before(:each) do
    @book_table_detail = assign(:book_table_detail, BookTableDetail.create!(
      :user_id => 1,
      :book_table_id => 1,
      :dish_id => 1,
      :price => 1.5
    ))
  end

  it "renders the edit book_table_detail form" do
    render

    assert_select "form[action=?][method=?]", book_table_detail_path(@book_table_detail), "post" do

      assert_select "input[name=?]", "book_table_detail[user_id]"

      assert_select "input[name=?]", "book_table_detail[book_table_id]"

      assert_select "input[name=?]", "book_table_detail[dish_id]"

      assert_select "input[name=?]", "book_table_detail[price]"
    end
  end
end
