require "spec_helper"

describe SivicPermissaosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_permissaos").should route_to("sivic_permissaos#index")
    end

    it "routes to #new" do
      get("/sivic_permissaos/new").should route_to("sivic_permissaos#new")
    end

    it "routes to #show" do
      get("/sivic_permissaos/1").should route_to("sivic_permissaos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_permissaos/1/edit").should route_to("sivic_permissaos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_permissaos").should route_to("sivic_permissaos#create")
    end

    it "routes to #update" do
      put("/sivic_permissaos/1").should route_to("sivic_permissaos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_permissaos/1").should route_to("sivic_permissaos#destroy", :id => "1")
    end

  end
end
