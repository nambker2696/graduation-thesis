require 'rails_helper'

RSpec.describe "cities/index", type: :view do
  before(:each) do
    assign(:cities, [
      City.create!(
        :city => "City"
      ),
      City.create!(
        :city => "City"
      )
    ])
  end

  it "renders a list of cities" do
    render
    assert_select "tr>td", :text => "City".to_s, :count => 2
  end
end
