require 'rails_helper'

RSpec.describe "admin/stores/edit", type: :view do
  before(:each) do
    @admin_store = assign(:admin_store, Store.create!())
  end

  it "renders the edit admin_store form" do
    render

    assert_select "form[action=?][method=?]", admin_store_path(@admin_store), "post" do
    end
  end
end
