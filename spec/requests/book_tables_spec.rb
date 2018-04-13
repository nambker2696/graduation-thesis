require 'rails_helper'

RSpec.describe "BookTables", type: :request do
  describe "GET /book_tables" do
    it "works! (now write some real specs)" do
      get book_tables_path
      expect(response).to have_http_status(200)
    end
  end
end
