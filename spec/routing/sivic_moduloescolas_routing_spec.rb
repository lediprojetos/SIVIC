require "spec_helper"

describe SivicModuloescolasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_moduloescolas").should route_to("sivic_moduloescolas#index")
    end

    it "routes to #new" do
      get("/sivic_moduloescolas/new").should route_to("sivic_moduloescolas#new")
    end

    it "routes to #show" do
      get("/sivic_moduloescolas/1").should route_to("sivic_moduloescolas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_moduloescolas/1/edit").should route_to("sivic_moduloescolas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_moduloescolas").should route_to("sivic_moduloescolas#create")
    end

    it "routes to #update" do
      put("/sivic_moduloescolas/1").should route_to("sivic_moduloescolas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_moduloescolas/1").should route_to("sivic_moduloescolas#destroy", :id => "1")
    end

  end
end
