require 'rails_helper'

RSpec.describe "admin/stores/new", type: :view do
  before(:each) do
    assign(:admin_store, Store.new())
  end

  it "renders new admin_store form" do
    render

    assert_select "form[action=?][method=?]", stores_path, "post" do
    end
  end
end
