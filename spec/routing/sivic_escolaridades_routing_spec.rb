require "spec_helper"

describe SivicEscolaridadesController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_escolaridades").should route_to("sivic_escolaridades#index")
    end

    it "routes to #new" do
      get("/sivic_escolaridades/new").should route_to("sivic_escolaridades#new")
    end

    it "routes to #show" do
      get("/sivic_escolaridades/1").should route_to("sivic_escolaridades#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_escolaridades/1/edit").should route_to("sivic_escolaridades#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_escolaridades").should route_to("sivic_escolaridades#create")
    end

    it "routes to #update" do
      put("/sivic_escolaridades/1").should route_to("sivic_escolaridades#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_escolaridades/1").should route_to("sivic_escolaridades#destroy", :id => "1")
    end

  end
end
