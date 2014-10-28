require "spec_helper"

describe SivicSitpartcelulasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_sitpartcelulas").should route_to("sivic_sitpartcelulas#index")
    end

    it "routes to #new" do
      get("/sivic_sitpartcelulas/new").should route_to("sivic_sitpartcelulas#new")
    end

    it "routes to #show" do
      get("/sivic_sitpartcelulas/1").should route_to("sivic_sitpartcelulas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_sitpartcelulas/1/edit").should route_to("sivic_sitpartcelulas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_sitpartcelulas").should route_to("sivic_sitpartcelulas#create")
    end

    it "routes to #update" do
      put("/sivic_sitpartcelulas/1").should route_to("sivic_sitpartcelulas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_sitpartcelulas/1").should route_to("sivic_sitpartcelulas#destroy", :id => "1")
    end

  end
end
