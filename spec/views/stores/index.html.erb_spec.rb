require 'rails_helper'

RSpec.describe "stores/index", type: :view do
  before(:each) do
    assign(:stores, [
      Store.create!(
        :name => "Name",
        :subdomain => "Subdomain",
        :user_id => 2
      ),
      Store.create!(
        :name => "Name",
        :subdomain => "Subdomain",
        :user_id => 2
      )
    ])
  end

  it "renders a list of stores" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Subdomain".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
