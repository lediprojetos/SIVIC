require "spec_helper"

describe SivicAulasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_aulas").should route_to("sivic_aulas#index")
    end

    it "routes to #new" do
      get("/sivic_aulas/new").should route_to("sivic_aulas#new")
    end

    it "routes to #show" do
      get("/sivic_aulas/1").should route_to("sivic_aulas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_aulas/1/edit").should route_to("sivic_aulas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_aulas").should route_to("sivic_aulas#create")
    end

    it "routes to #update" do
      put("/sivic_aulas/1").should route_to("sivic_aulas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_aulas/1").should route_to("sivic_aulas#destroy", :id => "1")
    end

  end
end
