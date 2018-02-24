require 'rails_helper'

RSpec.describe "stores/new", type: :view do
  before(:each) do
    assign(:store, Store.new(
      :name => "MyString",
      :subdomain => "MyString",
      :user_id => 1
    ))
  end

  it "renders new store form" do
    render

    assert_select "form[action=?][method=?]", stores_path, "post" do

      assert_select "input[name=?]", "store[name]"

      assert_select "input[name=?]", "store[subdomain]"

      assert_select "input[name=?]", "store[user_id]"
    end
  end
end
