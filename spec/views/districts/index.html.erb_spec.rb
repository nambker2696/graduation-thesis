require 'rails_helper'

RSpec.describe "districts/index", type: :view do
  before(:each) do
    assign(:districts, [
      District.create!(
        :district => "District"
      ),
      District.create!(
        :district => "District"
      )
    ])
  end

  it "renders a list of districts" do
    render
    assert_select "tr>td", :text => "District".to_s, :count => 2
  end
end
