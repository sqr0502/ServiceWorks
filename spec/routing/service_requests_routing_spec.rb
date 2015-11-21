require "rails_helper"

RSpec.describe ServiceRequestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/service_requests").to route_to("service_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/service_requests/new").to route_to("service_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/service_requests/1").to route_to("service_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/service_requests/1/edit").to route_to("service_requests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/service_requests").to route_to("service_requests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/service_requests/1").to route_to("service_requests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/service_requests/1").to route_to("service_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/service_requests/1").to route_to("service_requests#destroy", :id => "1")
    end

  end
end
