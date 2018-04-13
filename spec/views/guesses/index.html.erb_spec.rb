require 'rails_helper'

RSpec.describe "guesses/index", type: :view do
  before(:each) do
    assign(:guesses, [
      Guess.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :address => "Address"
      ),
      Guess.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :address => "Address"
      )
    ])
  end

  it "renders a list of guesses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
