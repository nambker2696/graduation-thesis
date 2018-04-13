require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Categorie.create!(
        :name => "Name",
        :display_name => "Display Name"
      ),
      Categorie.create!(
        :name => "Name",
        :display_name => "Display Name"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Display Name".to_s, :count => 2
  end
end
