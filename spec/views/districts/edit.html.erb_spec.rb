require 'rails_helper'

RSpec.describe "districts/edit", type: :view do
  before(:each) do
    @district = assign(:district, District.create!(
      :district => "MyString"
    ))
  end

  it "renders the edit district form" do
    render

    assert_select "form[action=?][method=?]", district_path(@district), "post" do

      assert_select "input[name=?]", "district[district]"
    end
  end
end
