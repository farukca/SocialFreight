require "spec_helper"

describe FinunitsController do
  describe "routing" do

    it "routes to #index" do
      get("/finunits").should route_to("finunits#index")
    end

    it "routes to #new" do
      get("/finunits/new").should route_to("finunits#new")
    end

    it "routes to #show" do
      get("/finunits/1").should route_to("finunits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/finunits/1/edit").should route_to("finunits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/finunits").should route_to("finunits#create")
    end

    it "routes to #update" do
      put("/finunits/1").should route_to("finunits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/finunits/1").should route_to("finunits#destroy", :id => "1")
    end

  end
end
