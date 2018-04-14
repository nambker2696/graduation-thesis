require 'rails_helper'

RSpec.describe "admin/users/new", type: :view do
  before(:each) do
    assign(:admin_user, User.new())
  end

  it "renders new admin_user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
    end
  end
end
