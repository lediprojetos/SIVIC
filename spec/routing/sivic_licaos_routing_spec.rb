require "spec_helper"

describe SivicLicaosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_licaos").should route_to("sivic_licaos#index")
    end

    it "routes to #new" do
      get("/sivic_licaos/new").should route_to("sivic_licaos#new")
    end

    it "routes to #show" do
      get("/sivic_licaos/1").should route_to("sivic_licaos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_licaos/1/edit").should route_to("sivic_licaos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_licaos").should route_to("sivic_licaos#create")
    end

    it "routes to #update" do
      put("/sivic_licaos/1").should route_to("sivic_licaos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_licaos/1").should route_to("sivic_licaos#destroy", :id => "1")
    end

  end
end
