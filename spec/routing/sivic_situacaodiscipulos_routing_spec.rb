require "spec_helper"

describe SivicSituacaodiscipulosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_situacaodiscipulos").should route_to("sivic_situacaodiscipulos#index")
    end

    it "routes to #new" do
      get("/sivic_situacaodiscipulos/new").should route_to("sivic_situacaodiscipulos#new")
    end

    it "routes to #show" do
      get("/sivic_situacaodiscipulos/1").should route_to("sivic_situacaodiscipulos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_situacaodiscipulos/1/edit").should route_to("sivic_situacaodiscipulos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_situacaodiscipulos").should route_to("sivic_situacaodiscipulos#create")
    end

    it "routes to #update" do
      put("/sivic_situacaodiscipulos/1").should route_to("sivic_situacaodiscipulos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_situacaodiscipulos/1").should route_to("sivic_situacaodiscipulos#destroy", :id => "1")
    end

  end
end
