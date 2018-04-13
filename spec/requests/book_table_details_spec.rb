require 'rails_helper'

RSpec.describe "BookTableDetails", type: :request do
  describe "GET /book_table_details" do
    it "works! (now write some real specs)" do
      get book_table_details_path
      expect(response).to have_http_status(200)
    end
  end
end
