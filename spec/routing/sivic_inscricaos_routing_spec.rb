require "spec_helper"

describe SivicInscricaosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_inscricaos").should route_to("sivic_inscricaos#index")
    end

    it "routes to #new" do
      get("/sivic_inscricaos/new").should route_to("sivic_inscricaos#new")
    end

    it "routes to #show" do
      get("/sivic_inscricaos/1").should route_to("sivic_inscricaos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_inscricaos/1/edit").should route_to("sivic_inscricaos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_inscricaos").should route_to("sivic_inscricaos#create")
    end

    it "routes to #update" do
      put("/sivic_inscricaos/1").should route_to("sivic_inscricaos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_inscricaos/1").should route_to("sivic_inscricaos#destroy", :id => "1")
    end

  end
end
