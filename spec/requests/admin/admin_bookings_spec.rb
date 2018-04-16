require 'rails_helper'

RSpec.describe "Admin::Bookings", type: :request do
  describe "GET /admin_bookings" do
    it "works! (now write some real specs)" do
      get admin_bookings_path
      expect(response).to have_http_status(200)
    end
  end
end
