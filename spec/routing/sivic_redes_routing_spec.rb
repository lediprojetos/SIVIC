require "spec_helper"

describe SivicRedesController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_redes").should route_to("sivic_redes#index")
    end

    it "routes to #new" do
      get("/sivic_redes/new").should route_to("sivic_redes#new")
    end

    it "routes to #show" do
      get("/sivic_redes/1").should route_to("sivic_redes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_redes/1/edit").should route_to("sivic_redes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_redes").should route_to("sivic_redes#create")
    end

    it "routes to #update" do
      put("/sivic_redes/1").should route_to("sivic_redes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_redes/1").should route_to("sivic_redes#destroy", :id => "1")
    end

  end
end
