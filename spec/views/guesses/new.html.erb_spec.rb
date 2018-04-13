require 'rails_helper'

RSpec.describe "guesses/new", type: :view do
  before(:each) do
    assign(:guess, Guess.new(
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :address => "MyString"
    ))
  end

  it "renders new guess form" do
    render

    assert_select "form[action=?][method=?]", guesses_path, "post" do

      assert_select "input[name=?]", "guess[name]"

      assert_select "input[name=?]", "guess[email]"

      assert_select "input[name=?]", "guess[phone]"

      assert_select "input[name=?]", "guess[address]"
    end
  end
end
