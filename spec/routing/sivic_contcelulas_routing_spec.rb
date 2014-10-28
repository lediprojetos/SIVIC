require "spec_helper"

describe SivicContcelulasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_contcelulas").should route_to("sivic_contcelulas#index")
    end

    it "routes to #new" do
      get("/sivic_contcelulas/new").should route_to("sivic_contcelulas#new")
    end

    it "routes to #show" do
      get("/sivic_contcelulas/1").should route_to("sivic_contcelulas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_contcelulas/1/edit").should route_to("sivic_contcelulas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_contcelulas").should route_to("sivic_contcelulas#create")
    end

    it "routes to #update" do
      put("/sivic_contcelulas/1").should route_to("sivic_contcelulas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_contcelulas/1").should route_to("sivic_contcelulas#destroy", :id => "1")
    end

  end
end
