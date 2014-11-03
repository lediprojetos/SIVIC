require "spec_helper"

describe SivicIgrejasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_igrejas").should route_to("sivic_igrejas#index")
    end

    it "routes to #new" do
      get("/sivic_igrejas/new").should route_to("sivic_igrejas#new")
    end

    it "routes to #show" do
      get("/sivic_igrejas/1").should route_to("sivic_igrejas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_igrejas/1/edit").should route_to("sivic_igrejas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_igrejas").should route_to("sivic_igrejas#create")
    end

    it "routes to #update" do
      put("/sivic_igrejas/1").should route_to("sivic_igrejas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_igrejas/1").should route_to("sivic_igrejas#destroy", :id => "1")
    end

  end
end
