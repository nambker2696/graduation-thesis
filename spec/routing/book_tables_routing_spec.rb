require "rails_helper"

RSpec.describe BookTablesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/book_tables").to route_to("book_tables#index")
    end

    it "routes to #new" do
      expect(:get => "/book_tables/new").to route_to("book_tables#new")
    end

    it "routes to #show" do
      expect(:get => "/book_tables/1").to route_to("book_tables#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/book_tables/1/edit").to route_to("book_tables#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/book_tables").to route_to("book_tables#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/book_tables/1").to route_to("book_tables#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/book_tables/1").to route_to("book_tables#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/book_tables/1").to route_to("book_tables#destroy", :id => "1")
    end

  end
end
