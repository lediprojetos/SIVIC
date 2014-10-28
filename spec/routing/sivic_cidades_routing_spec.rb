require "spec_helper"

describe SivicCidadesController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_cidades").should route_to("sivic_cidades#index")
    end

    it "routes to #new" do
      get("/sivic_cidades/new").should route_to("sivic_cidades#new")
    end

    it "routes to #show" do
      get("/sivic_cidades/1").should route_to("sivic_cidades#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_cidades/1/edit").should route_to("sivic_cidades#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_cidades").should route_to("sivic_cidades#create")
    end

    it "routes to #update" do
      put("/sivic_cidades/1").should route_to("sivic_cidades#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_cidades/1").should route_to("sivic_cidades#destroy", :id => "1")
    end

  end
end
