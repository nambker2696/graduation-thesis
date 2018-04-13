require 'rails_helper'

RSpec.describe "guesses/edit", type: :view do
  before(:each) do
    @guess = assign(:guess, Guess.create!(
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :address => "MyString"
    ))
  end

  it "renders the edit guess form" do
    render

    assert_select "form[action=?][method=?]", guess_path(@guess), "post" do

      assert_select "input[name=?]", "guess[name]"

      assert_select "input[name=?]", "guess[email]"

      assert_select "input[name=?]", "guess[phone]"

      assert_select "input[name=?]", "guess[address]"
    end
  end
end
