require "spec_helper"

describe SivicSituacaoatividadesController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_situacaoatividades").should route_to("sivic_situacaoatividades#index")
    end

    it "routes to #new" do
      get("/sivic_situacaoatividades/new").should route_to("sivic_situacaoatividades#new")
    end

    it "routes to #show" do
      get("/sivic_situacaoatividades/1").should route_to("sivic_situacaoatividades#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_situacaoatividades/1/edit").should route_to("sivic_situacaoatividades#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_situacaoatividades").should route_to("sivic_situacaoatividades#create")
    end

    it "routes to #update" do
      put("/sivic_situacaoatividades/1").should route_to("sivic_situacaoatividades#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_situacaoatividades/1").should route_to("sivic_situacaoatividades#destroy", :id => "1")
    end

  end
end
