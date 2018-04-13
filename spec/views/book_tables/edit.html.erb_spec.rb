require 'rails_helper'

RSpec.describe "book_tables/edit", type: :view do
  before(:each) do
    @book_table = assign(:book_table, BookTable.create!(
      :user_id => 1,
      :guess_id => 1,
      :total_price => 1.5,
      :status => false
    ))
  end

  it "renders the edit book_table form" do
    render

    assert_select "form[action=?][method=?]", book_table_path(@book_table), "post" do

      assert_select "input[name=?]", "book_table[user_id]"

      assert_select "input[name=?]", "book_table[guess_id]"

      assert_select "input[name=?]", "book_table[total_price]"

      assert_select "input[name=?]", "book_table[status]"
    end
  end
end
