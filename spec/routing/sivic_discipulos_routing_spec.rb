require "spec_helper"

describe SivicDiscipulosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_discipulos").should route_to("sivic_discipulos#index")
    end

    it "routes to #new" do
      get("/sivic_discipulos/new").should route_to("sivic_discipulos#new")
    end

    it "routes to #show" do
      get("/sivic_discipulos/1").should route_to("sivic_discipulos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_discipulos/1/edit").should route_to("sivic_discipulos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_discipulos").should route_to("sivic_discipulos#create")
    end

    it "routes to #update" do
      put("/sivic_discipulos/1").should route_to("sivic_discipulos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_discipulos/1").should route_to("sivic_discipulos#destroy", :id => "1")
    end

  end
end
