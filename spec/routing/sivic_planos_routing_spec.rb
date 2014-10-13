require "spec_helper"

describe SivicPlanosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_planos").should route_to("sivic_planos#index")
    end

    it "routes to #new" do
      get("/sivic_planos/new").should route_to("sivic_planos#new")
    end

    it "routes to #show" do
      get("/sivic_planos/1").should route_to("sivic_planos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_planos/1/edit").should route_to("sivic_planos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_planos").should route_to("sivic_planos#create")
    end

    it "routes to #update" do
      put("/sivic_planos/1").should route_to("sivic_planos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_planos/1").should route_to("sivic_planos#destroy", :id => "1")
    end

  end
end
