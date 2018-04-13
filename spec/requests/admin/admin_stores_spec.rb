require 'rails_helper'

RSpec.describe "Admin::Stores", type: :request do
  describe "GET /admin_stores" do
    it "works! (now write some real specs)" do
      get admin_stores_path
      expect(response).to have_http_status(200)
    end
  end
end
