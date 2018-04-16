require "rails_helper"

RSpec.describe Admin::BookingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/bookings").to route_to("admin/bookings#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/bookings/new").to route_to("admin/bookings#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/bookings/1").to route_to("admin/bookings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/bookings/1/edit").to route_to("admin/bookings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/bookings").to route_to("admin/bookings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/bookings/1").to route_to("admin/bookings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/bookings/1").to route_to("admin/bookings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/bookings/1").to route_to("admin/bookings#destroy", :id => "1")
    end

  end
end
