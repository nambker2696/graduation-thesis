require 'rails_helper'

RSpec.describe "guesses/show", type: :view do
  before(:each) do
    @guess = assign(:guess, Guess.create!(
      :name => "Name",
      :email => "Email",
      :phone => "Phone",
      :address => "Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Address/)
  end
end
