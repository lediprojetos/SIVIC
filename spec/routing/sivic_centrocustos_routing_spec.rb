require "spec_helper"

describe SivicCentrocustosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_centrocustos").should route_to("sivic_centrocustos#index")
    end

    it "routes to #new" do
      get("/sivic_centrocustos/new").should route_to("sivic_centrocustos#new")
    end

    it "routes to #show" do
      get("/sivic_centrocustos/1").should route_to("sivic_centrocustos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_centrocustos/1/edit").should route_to("sivic_centrocustos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_centrocustos").should route_to("sivic_centrocustos#create")
    end

    it "routes to #update" do
      put("/sivic_centrocustos/1").should route_to("sivic_centrocustos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_centrocustos/1").should route_to("sivic_centrocustos#destroy", :id => "1")
    end

  end
end
