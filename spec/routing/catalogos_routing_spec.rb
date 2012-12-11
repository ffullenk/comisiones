require "spec_helper"

describe CatalogosController do
  describe "routing" do

    it "routes to #index" do
      get("/catalogos").should route_to("catalogos#index")
    end

    it "routes to #new" do
      get("/catalogos/new").should route_to("catalogos#new")
    end

    it "routes to #show" do
      get("/catalogos/1").should route_to("catalogos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/catalogos/1/edit").should route_to("catalogos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/catalogos").should route_to("catalogos#create")
    end

    it "routes to #update" do
      put("/catalogos/1").should route_to("catalogos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/catalogos/1").should route_to("catalogos#destroy", :id => "1")
    end

  end
end
