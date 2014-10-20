require "spec_helper"

describe SivicPeriodicidadeconsController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_periodicidadecons").should route_to("sivic_periodicidadecons#index")
    end

    it "routes to #new" do
      get("/sivic_periodicidadecons/new").should route_to("sivic_periodicidadecons#new")
    end

    it "routes to #show" do
      get("/sivic_periodicidadecons/1").should route_to("sivic_periodicidadecons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_periodicidadecons/1/edit").should route_to("sivic_periodicidadecons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_periodicidadecons").should route_to("sivic_periodicidadecons#create")
    end

    it "routes to #update" do
      put("/sivic_periodicidadecons/1").should route_to("sivic_periodicidadecons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_periodicidadecons/1").should route_to("sivic_periodicidadecons#destroy", :id => "1")
    end

  end
end
