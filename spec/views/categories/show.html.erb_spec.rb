require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    @categorie = assign(:categorie, Categorie.create!(
      :name => "Name",
      :display_name => "Display Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Display Name/)
  end
end
