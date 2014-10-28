require "spec_helper"

describe SivicPartevenrelacelulasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_partevenrelacelulas").should route_to("sivic_partevenrelacelulas#index")
    end

    it "routes to #new" do
      get("/sivic_partevenrelacelulas/new").should route_to("sivic_partevenrelacelulas#new")
    end

    it "routes to #show" do
      get("/sivic_partevenrelacelulas/1").should route_to("sivic_partevenrelacelulas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_partevenrelacelulas/1/edit").should route_to("sivic_partevenrelacelulas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_partevenrelacelulas").should route_to("sivic_partevenrelacelulas#create")
    end

    it "routes to #update" do
      put("/sivic_partevenrelacelulas/1").should route_to("sivic_partevenrelacelulas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_partevenrelacelulas/1").should route_to("sivic_partevenrelacelulas#destroy", :id => "1")
    end

  end
end
