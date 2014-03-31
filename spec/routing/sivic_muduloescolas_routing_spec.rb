require "spec_helper"

describe SivicMuduloescolasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_muduloescolas").should route_to("sivic_muduloescolas#index")
    end

    it "routes to #new" do
      get("/sivic_muduloescolas/new").should route_to("sivic_muduloescolas#new")
    end

    it "routes to #show" do
      get("/sivic_muduloescolas/1").should route_to("sivic_muduloescolas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_muduloescolas/1/edit").should route_to("sivic_muduloescolas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_muduloescolas").should route_to("sivic_muduloescolas#create")
    end

    it "routes to #update" do
      put("/sivic_muduloescolas/1").should route_to("sivic_muduloescolas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_muduloescolas/1").should route_to("sivic_muduloescolas#destroy", :id => "1")
    end

  end
end
