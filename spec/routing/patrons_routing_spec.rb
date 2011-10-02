require "spec_helper"

describe PatronsController do
  describe "routing" do

    it "routes to #index" do
      get("/patrons").should route_to("patrons#index")
    end

    it "routes to #new" do
      get("/patrons/new").should route_to("patrons#new")
    end

    it "routes to #show" do
      get("/patrons/1").should route_to("patrons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/patrons/1/edit").should route_to("patrons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/patrons").should route_to("patrons#create")
    end

    it "routes to #update" do
      put("/patrons/1").should route_to("patrons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/patrons/1").should route_to("patrons#destroy", :id => "1")
    end

  end
end
