require 'rails_helper'

RSpec.describe "stores/edit", type: :view do
  before(:each) do
    @store = assign(:store, Store.create!(
      :subdomain => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit store form" do
    render

    assert_select "form[action=?][method=?]", store_path(@store), "post" do

      assert_select "input[name=?]", "store[subdomain]"

      assert_select "input[name=?]", "store[user_id]"
    end
  end
end
