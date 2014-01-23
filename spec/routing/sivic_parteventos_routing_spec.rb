require "spec_helper"

describe SivicParteventosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_parteventos").should route_to("sivic_parteventos#index")
    end

    it "routes to #new" do
      get("/sivic_parteventos/new").should route_to("sivic_parteventos#new")
    end

    it "routes to #show" do
      get("/sivic_parteventos/1").should route_to("sivic_parteventos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_parteventos/1/edit").should route_to("sivic_parteventos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_parteventos").should route_to("sivic_parteventos#create")
    end

    it "routes to #update" do
      put("/sivic_parteventos/1").should route_to("sivic_parteventos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_parteventos/1").should route_to("sivic_parteventos#destroy", :id => "1")
    end

  end
end
