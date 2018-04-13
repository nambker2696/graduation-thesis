require 'rails_helper'

RSpec.describe "book_tables/show", type: :view do
  before(:each) do
    @book_table = assign(:book_table, BookTable.create!(
      :user_id => 2,
      :guess_id => 3,
      :total_price => 4.5,
      :status => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/false/)
  end
end
