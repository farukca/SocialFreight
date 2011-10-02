require "spec_helper"

describe PositionsController do
  describe "routing" do

    it "routes to #index" do
      get("/positions").should route_to("positions#index")
    end

    it "routes to #new" do
      get("/positions/new").should route_to("positions#new")
    end

    it "routes to #show" do
      get("/positions/1").should route_to("positions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/positions/1/edit").should route_to("positions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/positions").should route_to("positions#create")
    end

    it "routes to #update" do
      put("/positions/1").should route_to("positions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/positions/1").should route_to("positions#destroy", :id => "1")
    end

  end
end
