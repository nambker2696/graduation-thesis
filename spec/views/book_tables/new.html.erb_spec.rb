require 'rails_helper'

RSpec.describe "book_tables/new", type: :view do
  before(:each) do
    assign(:book_table, BookTable.new(
      :user_id => 1,
      :guess_id => 1,
      :total_price => 1.5,
      :status => false
    ))
  end

  it "renders new book_table form" do
    render

    assert_select "form[action=?][method=?]", book_tables_path, "post" do

      assert_select "input[name=?]", "book_table[user_id]"

      assert_select "input[name=?]", "book_table[guess_id]"

      assert_select "input[name=?]", "book_table[total_price]"

      assert_select "input[name=?]", "book_table[status]"
    end
  end
end
