require "spec_helper"

describe SivicRelatorioscelulasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_relatorioscelulas").should route_to("sivic_relatorioscelulas#index")
    end

    it "routes to #new" do
      get("/sivic_relatorioscelulas/new").should route_to("sivic_relatorioscelulas#new")
    end

    it "routes to #show" do
      get("/sivic_relatorioscelulas/1").should route_to("sivic_relatorioscelulas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_relatorioscelulas/1/edit").should route_to("sivic_relatorioscelulas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_relatorioscelulas").should route_to("sivic_relatorioscelulas#create")
    end

    it "routes to #update" do
      put("/sivic_relatorioscelulas/1").should route_to("sivic_relatorioscelulas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_relatorioscelulas/1").should route_to("sivic_relatorioscelulas#destroy", :id => "1")
    end

  end
end
