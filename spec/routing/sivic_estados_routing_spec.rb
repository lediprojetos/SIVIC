require "spec_helper"

describe SivicEstadosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_estados").should route_to("sivic_estados#index")
    end

    it "routes to #new" do
      get("/sivic_estados/new").should route_to("sivic_estados#new")
    end

    it "routes to #show" do
      get("/sivic_estados/1").should route_to("sivic_estados#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_estados/1/edit").should route_to("sivic_estados#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_estados").should route_to("sivic_estados#create")
    end

    it "routes to #update" do
      put("/sivic_estados/1").should route_to("sivic_estados#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_estados/1").should route_to("sivic_estados#destroy", :id => "1")
    end

  end
end
