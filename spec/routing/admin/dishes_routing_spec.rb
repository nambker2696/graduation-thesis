require "rails_helper"

RSpec.describe Admin::DishesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/dishes").to route_to("admin/dishes#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/dishes/new").to route_to("admin/dishes#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/dishes/1").to route_to("admin/dishes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/dishes/1/edit").to route_to("admin/dishes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/dishes").to route_to("admin/dishes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/dishes/1").to route_to("admin/dishes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/dishes/1").to route_to("admin/dishes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/dishes/1").to route_to("admin/dishes#destroy", :id => "1")
    end

  end
end
