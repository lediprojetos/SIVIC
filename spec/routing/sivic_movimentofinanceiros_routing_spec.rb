require "spec_helper"

describe SivicMovimentofinanceirosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_movimentofinanceiros").should route_to("sivic_movimentofinanceiros#index")
    end

    it "routes to #new" do
      get("/sivic_movimentofinanceiros/new").should route_to("sivic_movimentofinanceiros#new")
    end

    it "routes to #show" do
      get("/sivic_movimentofinanceiros/1").should route_to("sivic_movimentofinanceiros#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_movimentofinanceiros/1/edit").should route_to("sivic_movimentofinanceiros#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_movimentofinanceiros").should route_to("sivic_movimentofinanceiros#create")
    end

    it "routes to #update" do
      put("/sivic_movimentofinanceiros/1").should route_to("sivic_movimentofinanceiros#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_movimentofinanceiros/1").should route_to("sivic_movimentofinanceiros#destroy", :id => "1")
    end

  end
end
