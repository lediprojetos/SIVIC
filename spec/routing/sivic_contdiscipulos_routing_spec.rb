require "spec_helper"

describe SivicContdiscipulosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_contdiscipulos").should route_to("sivic_contdiscipulos#index")
    end

    it "routes to #new" do
      get("/sivic_contdiscipulos/new").should route_to("sivic_contdiscipulos#new")
    end

    it "routes to #show" do
      get("/sivic_contdiscipulos/1").should route_to("sivic_contdiscipulos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_contdiscipulos/1/edit").should route_to("sivic_contdiscipulos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_contdiscipulos").should route_to("sivic_contdiscipulos#create")
    end

    it "routes to #update" do
      put("/sivic_contdiscipulos/1").should route_to("sivic_contdiscipulos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_contdiscipulos/1").should route_to("sivic_contdiscipulos#destroy", :id => "1")
    end

  end
end
