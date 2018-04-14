require 'rails_helper'

RSpec.describe "admin/users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(),
      User.create!()
    ])
  end

  it "renders a list of admin/users" do
    render
  end
end
