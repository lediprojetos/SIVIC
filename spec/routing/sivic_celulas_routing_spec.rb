require "spec_helper"

describe SivicCelulasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_celulas").should route_to("sivic_celulas#index")
    end

    it "routes to #new" do
      get("/sivic_celulas/new").should route_to("sivic_celulas#new")
    end

    it "routes to #show" do
      get("/sivic_celulas/1").should route_to("sivic_celulas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_celulas/1/edit").should route_to("sivic_celulas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_celulas").should route_to("sivic_celulas#create")
    end

    it "routes to #update" do
      put("/sivic_celulas/1").should route_to("sivic_celulas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_celulas/1").should route_to("sivic_celulas#destroy", :id => "1")
    end

  end
end
