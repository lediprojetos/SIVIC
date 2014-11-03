require "spec_helper"

describe SivicParticipantecelulasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_participantecelulas").should route_to("sivic_participantecelulas#index")
    end

    it "routes to #new" do
      get("/sivic_participantecelulas/new").should route_to("sivic_participantecelulas#new")
    end

    it "routes to #show" do
      get("/sivic_participantecelulas/1").should route_to("sivic_participantecelulas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_participantecelulas/1/edit").should route_to("sivic_participantecelulas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_participantecelulas").should route_to("sivic_participantecelulas#create")
    end

    it "routes to #update" do
      put("/sivic_participantecelulas/1").should route_to("sivic_participantecelulas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_participantecelulas/1").should route_to("sivic_participantecelulas#destroy", :id => "1")
    end

  end
end
