require 'rails_helper'

RSpec.describe "Admin::Dishes", type: :request do
  describe "GET /admin_dishes" do
    it "works! (now write some real specs)" do
      get admin_dishes_path
      expect(response).to have_http_status(200)
    end
  end
end
