require 'rails_helper'

RSpec.describe "districts/show", type: :view do
  before(:each) do
    @district = assign(:district, District.create!(
      :district => "District"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/District/)
  end
end
