require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @categorie = assign(:categorie, Categorie.create!(
      :name => "MyString",
      :display_name => "MyString"
    ))
  end

  it "renders the edit categorie form" do
    render

    assert_select "form[action=?][method=?]", categorie_path(@categorie), "post" do

      assert_select "input[name=?]", "categorie[name]"

      assert_select "input[name=?]", "categorie[display_name]"
    end
  end
end
