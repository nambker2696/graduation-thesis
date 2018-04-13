require 'rails_helper'

RSpec.describe "book_table_details/show", type: :view do
  before(:each) do
    @book_table_detail = assign(:book_table_detail, BookTableDetail.create!(
      :user_id => 2,
      :book_table_id => 3,
      :dish_id => 4,
      :price => 5.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5.5/)
  end
end
