require "spec_helper"

describe SivicModulosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_modulos").should route_to("sivic_modulos#index")
    end

    it "routes to #new" do
      get("/sivic_modulos/new").should route_to("sivic_modulos#new")
    end

    it "routes to #show" do
      get("/sivic_modulos/1").should route_to("sivic_modulos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_modulos/1/edit").should route_to("sivic_modulos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_modulos").should route_to("sivic_modulos#create")
    end

    it "routes to #update" do
      put("/sivic_modulos/1").should route_to("sivic_modulos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_modulos/1").should route_to("sivic_modulos#destroy", :id => "1")
    end

  end
end
