require "spec_helper"

describe SivicBancosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_bancos").should route_to("sivic_bancos#index")
    end

    it "routes to #new" do
      get("/sivic_bancos/new").should route_to("sivic_bancos#new")
    end

    it "routes to #show" do
      get("/sivic_bancos/1").should route_to("sivic_bancos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_bancos/1/edit").should route_to("sivic_bancos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_bancos").should route_to("sivic_bancos#create")
    end

    it "routes to #update" do
      put("/sivic_bancos/1").should route_to("sivic_bancos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_bancos/1").should route_to("sivic_bancos#destroy", :id => "1")
    end

  end
end
