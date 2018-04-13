require "rails_helper"

RSpec.describe Admin::StoresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/stores").to route_to("admin/stores#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/stores/new").to route_to("admin/stores#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/stores/1").to route_to("admin/stores#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/stores/1/edit").to route_to("admin/stores#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/stores").to route_to("admin/stores#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/stores/1").to route_to("admin/stores#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/stores/1").to route_to("admin/stores#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/stores/1").to route_to("admin/stores#destroy", :id => "1")
    end

  end
end
