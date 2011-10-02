require "spec_helper"

describe LoadingsController do
  describe "routing" do

    it "routes to #index" do
      get("/loadings").should route_to("loadings#index")
    end

    it "routes to #new" do
      get("/loadings/new").should route_to("loadings#new")
    end

    it "routes to #show" do
      get("/loadings/1").should route_to("loadings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/loadings/1/edit").should route_to("loadings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/loadings").should route_to("loadings#create")
    end

    it "routes to #update" do
      put("/loadings/1").should route_to("loadings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/loadings/1").should route_to("loadings#destroy", :id => "1")
    end

  end
end
