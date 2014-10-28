require "spec_helper"

describe SivicSituacoesrelatoriosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_situacoesrelatorios").should route_to("sivic_situacoesrelatorios#index")
    end

    it "routes to #new" do
      get("/sivic_situacoesrelatorios/new").should route_to("sivic_situacoesrelatorios#new")
    end

    it "routes to #show" do
      get("/sivic_situacoesrelatorios/1").should route_to("sivic_situacoesrelatorios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_situacoesrelatorios/1/edit").should route_to("sivic_situacoesrelatorios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_situacoesrelatorios").should route_to("sivic_situacoesrelatorios#create")
    end

    it "routes to #update" do
      put("/sivic_situacoesrelatorios/1").should route_to("sivic_situacoesrelatorios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_situacoesrelatorios/1").should route_to("sivic_situacoesrelatorios#destroy", :id => "1")
    end

  end
end
