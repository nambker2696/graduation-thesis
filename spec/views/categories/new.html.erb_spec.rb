require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:categorie, Categorie.new(
      :name => "MyString",
      :display_name => "MyString"
    ))
  end

  it "renders new categorie form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input[name=?]", "categorie[name]"

      assert_select "input[name=?]", "categorie[display_name]"
    end
  end
end
