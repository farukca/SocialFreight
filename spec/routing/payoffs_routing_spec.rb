require "spec_helper"

describe PayoffsController do
  describe "routing" do

    it "routes to #index" do
      get("/payoffs").should route_to("payoffs#index")
    end

    it "routes to #new" do
      get("/payoffs/new").should route_to("payoffs#new")
    end

    it "routes to #show" do
      get("/payoffs/1").should route_to("payoffs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/payoffs/1/edit").should route_to("payoffs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/payoffs").should route_to("payoffs#create")
    end

    it "routes to #update" do
      put("/payoffs/1").should route_to("payoffs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/payoffs/1").should route_to("payoffs#destroy", :id => "1")
    end

  end
end
