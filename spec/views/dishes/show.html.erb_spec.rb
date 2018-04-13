require 'rails_helper'

RSpec.describe "dishes/show", type: :view do
  before(:each) do
    @dish = assign(:dish, Dish.create!(
      :name => "Name",
      :display_name => "Display Name",
      :subtitle => "",
      :price => 2.5,
      :description => "Description",
      :category_id => 3,
      :tags => "Tags"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Display Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Tags/)
  end
end
