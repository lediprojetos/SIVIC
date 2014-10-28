require "spec_helper"

describe SivicProfissaosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_profissaos").should route_to("sivic_profissaos#index")
    end

    it "routes to #new" do
      get("/sivic_profissaos/new").should route_to("sivic_profissaos#new")
    end

    it "routes to #show" do
      get("/sivic_profissaos/1").should route_to("sivic_profissaos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_profissaos/1/edit").should route_to("sivic_profissaos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_profissaos").should route_to("sivic_profissaos#create")
    end

    it "routes to #update" do
      put("/sivic_profissaos/1").should route_to("sivic_profissaos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_profissaos/1").should route_to("sivic_profissaos#destroy", :id => "1")
    end

  end
end
